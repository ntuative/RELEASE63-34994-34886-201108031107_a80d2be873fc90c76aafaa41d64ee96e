package com.sulake.habbo.sound.trax
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class TraxSequencer implements IHabboSound, IDisposable
   {
      
      private static const const_118:Number = 44100;
      
      private static const const_119:uint = 8192;
      
      private static const const_1168:uint = 88000;
      
      private static const const_733:uint = 88000;
      
      private static const const_202:Vector.<int> = new Vector.<int>(const_119,true);
      
      private static const INTERPOLATION_BUFFER:Vector.<int> = new Vector.<int>(const_119,true);
       
      
      private var _disposed:Boolean = false;
      
      private var _events:IEventDispatcher;
      
      private var var_1094:Number;
      
      private var var_1132:Sound;
      
      private var var_500:SoundChannel;
      
      private var var_502:TraxData;
      
      private var var_1694:Map;
      
      private var var_1162:Boolean;
      
      private var var_1698:int;
      
      private var var_1697:int = 0;
      
      private var var_187:uint;
      
      private var var_355:Array;
      
      private var var_1696:Boolean;
      
      private var var_750:Boolean = true;
      
      private var var_307:uint;
      
      private var var_1695:uint;
      
      private var var_1134:Boolean;
      
      private var var_925:Boolean;
      
      private var var_926:int;
      
      private var var_501:int;
      
      private var var_1133:int;
      
      private var var_605:int;
      
      private var var_749:Timer;
      
      private var var_503:Timer;
      
      private var var_1693:Boolean;
      
      private var var_1392:int = 0;
      
      private var var_2198:int = 0;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1695 = uint(30);
         super();
         this._events = param4;
         this.var_1698 = param1;
         this.var_1094 = 1;
         this.var_1132 = new Sound();
         this.var_500 = null;
         this.var_1694 = param3;
         this.var_502 = param2;
         this.var_1162 = true;
         this.var_187 = 0;
         this.var_355 = [];
         this.var_1696 = false;
         this.var_307 = 0;
         this.var_750 = false;
         this.var_1134 = false;
         this.var_925 = false;
         this.var_926 = 0;
         this.var_501 = 0;
         this.var_1133 = 0;
         this.var_605 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_187 = uint(param1 * const_118);
      }
      
      public function get volume() : Number
      {
         return this.var_1094;
      }
      
      public function get position() : Number
      {
         return this.var_187 / const_118;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1162;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1162 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_750;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_501 / const_118;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_501 = int(param1 * const_118);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_926 / const_118;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_926 = int(param1 * const_118);
      }
      
      public function get traxData() : TraxData
      {
         return this.var_502;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_1094 = param1;
         if(this.var_500 != null)
         {
            this.var_500.soundTransform = new SoundTransform(this.var_1094);
         }
      }
      
      public function get length() : Number
      {
         return this.var_307 / const_118;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.stopImmediately();
            this.var_502 = null;
            this.var_1694 = null;
            this.var_355 = null;
            this._events = null;
            this.var_1132 = null;
            this._disposed = true;
         }
      }
      
      public function prepare() : Boolean
      {
         if(!this.var_1162)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1696)
         {
            if(this.var_502 != null)
            {
               this.var_1693 = false;
               if(this.var_502.hasMetaData)
               {
                  this.var_1693 = this.var_502.metaCutMode;
               }
               if(this.var_1693)
               {
                  if(!this.prepareSequence())
                  {
                     Logger.log("Cannot start playback, prepare sequence failed!");
                     return false;
                  }
               }
               else if(!this.prepareLegacySequence())
               {
                  Logger.log("Cannot start playback, prepare legacy sequence failed!");
                  return false;
               }
            }
         }
         return true;
      }
      
      private function prepareLegacySequence() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this.var_355 == null)
         {
            return false;
         }
         var _loc1_:uint = getTimer();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_502.channels.length)
         {
            _loc3_ = new Map();
            _loc4_ = this.var_502.channels[_loc2_] as TraxChannel;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc4_.itemCount)
            {
               _loc8_ = _loc4_.getItem(_loc7_).id;
               _loc9_ = this.var_1694.getValue(_loc8_) as TraxSample;
               _loc9_.setUsageFromSong(this.var_1698,_loc1_);
               if(_loc9_ == null)
               {
                  Logger.log("Error in prepareLegacySequence(), sample was null!");
               }
               continue;
               _loc10_ = this.getSampleBars(_loc9_.length);
               _loc11_ = _loc4_.getItem(_loc7_).length / _loc10_;
               _loc12_ = 0;
               while(_loc12_ < _loc11_)
               {
                  if(_loc8_ != 0)
                  {
                     _loc3_.add(_loc5_,_loc9_);
                  }
                  _loc6_ += _loc10_;
                  _loc5_ = uint(_loc6_ * const_733);
                  _loc12_++;
               }
               if(this.var_307 < _loc5_)
               {
                  this.var_307 = _loc5_;
               }
               _loc7_++;
               return false;
            }
            this.var_355.push(_loc3_);
            _loc2_++;
         }
         this.var_1696 = true;
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.var_355 == null)
         {
            return false;
         }
         var _loc1_:uint = getTimer();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_502.channels.length)
         {
            _loc3_ = new Map();
            _loc4_ = this.var_502.channels[_loc2_] as TraxChannel;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = false;
            _loc8_ = 0;
            while(_loc8_ < _loc4_.itemCount)
            {
               _loc9_ = _loc4_.getItem(_loc8_).id;
               _loc10_ = this.var_1694.getValue(_loc9_) as TraxSample;
               _loc10_.setUsageFromSong(this.var_1698,_loc1_);
               if(_loc10_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc11_ = _loc6_;
               _loc12_ = _loc5_;
               _loc13_ = this.getSampleBars(_loc10_.length);
               _loc14_ = _loc4_.getItem(_loc8_).length;
               while(_loc11_ < _loc6_ + _loc14_)
               {
                  if(_loc9_ != 0 || _loc7_)
                  {
                     _loc3_.add(_loc12_,_loc10_);
                     _loc7_ = false;
                  }
                  _loc11_ += _loc13_;
                  _loc12_ = _loc11_ * const_733;
                  if(_loc11_ > _loc6_ + _loc14_)
                  {
                     _loc7_ = true;
                  }
               }
               _loc6_ += _loc4_.getItem(_loc8_).length;
               _loc5_ = uint(_loc6_ * const_733);
               if(this.var_307 < _loc5_)
               {
                  this.var_307 = _loc5_;
               }
               _loc8_++;
               return false;
            }
            this.var_355.push(_loc3_);
            _loc2_++;
         }
         this.var_1696 = true;
         return true;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         this.removeFadeoutStopTimer();
         if(this.var_500 != null)
         {
            this.stopImmediately();
         }
         if(this.var_926 > 0)
         {
            this.var_1134 = true;
            this.var_1133 = 0;
         }
         this.var_925 = false;
         this.var_605 = 0;
         this.var_750 = false;
         this.var_1132.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this.var_1697 = param1 * const_118;
         this.var_1392 = 0;
         this.var_2198 = 0;
         this.var_500 = this.var_1132.play();
         this.volume = this.var_1094;
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_750)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(this.var_501 > 0 && !this.var_750)
         {
            this.stopWithFadeout();
         }
         else
         {
            this.playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         this.removeStopTimer();
         if(this.var_500 != null)
         {
            this.var_500.stop();
            this.var_500 = null;
         }
         if(this.var_1132 != null)
         {
            this.var_1132.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
      }
      
      private function stopWithFadeout() : void
      {
         if(this.var_749 == null)
         {
            this.var_925 = true;
            this.var_605 = 0;
            this.var_749 = new Timer(this.var_1695 + this.var_501 / (const_118 / 1000),1);
            this.var_749.start();
            this.var_749.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         if(this.var_1693)
         {
            return Math.round(param1 / const_1168);
         }
         return Math.ceil(param1 / const_1168);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = [];
         if(this.var_355 != null)
         {
            _loc2_ = this.var_355.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.var_355[_loc3_];
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length && _loc4_.getKey(_loc5_) < this.var_187)
               {
                  _loc5_++;
               }
               _loc1_.push(_loc5_ - 1);
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.var_355 == null)
         {
            return;
         }
         var _loc1_:Array = this.getChannelSequenceOffsets();
         var _loc2_:int = this.var_355.length;
         var _loc3_:* = null;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_355[_loc4_];
            _loc6_ = _loc1_[_loc4_];
            _loc7_ = _loc5_.getWithIndex(_loc6_);
            if(_loc7_ == null)
            {
               _loc3_ = null;
            }
            else
            {
               _loc10_ = _loc5_.getKey(_loc6_);
               _loc11_ = this.var_187 - _loc10_;
               if(_loc7_.id == 0 || _loc11_ < 0)
               {
                  _loc3_ = null;
               }
               else
               {
                  _loc3_ = new TraxChannelSample(_loc7_,_loc11_);
               }
            }
            _loc8_ = const_119;
            if(this.var_307 - this.var_187 < _loc8_)
            {
               _loc8_ = this.var_307 - this.var_187;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc12_ = _loc8_;
               if(_loc6_ < _loc5_.length - 1)
               {
                  _loc13_ = _loc5_.getKey(_loc6_ + 1);
                  if(_loc8_ + this.var_187 >= _loc13_)
                  {
                     _loc12_ = _loc13_ - this.var_187;
                  }
               }
               if(_loc12_ > _loc8_ - _loc9_)
               {
                  _loc12_ = _loc8_ - _loc9_;
               }
               if(_loc4_ == _loc2_ - 1)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.setSample(const_202,_loc9_,_loc12_);
                     _loc9_ += _loc12_;
                  }
                  else
                  {
                     _loc14_ = 0;
                     while(_loc14_ < _loc12_)
                     {
                        var _loc15_:*;
                        const_202[_loc15_ = _loc9_++] = 0;
                        _loc14_++;
                     }
                  }
               }
               else
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.addSample(const_202,_loc9_,_loc12_);
                  }
                  _loc9_ += _loc12_;
               }
               if(_loc9_ < _loc8_)
               {
                  _loc7_ = _loc5_.getWithIndex(++_loc6_);
                  if(_loc7_ == null || _loc7_.id == 0)
                  {
                     _loc3_ = null;
                  }
                  else
                  {
                     _loc3_ = new TraxChannelSample(_loc7_,0);
                  }
               }
            }
            _loc4_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = this.var_307 < this.var_1697 ? int(this.var_307) : (this.var_1697 > 0 ? int(this.var_1697) : int(this.var_307));
         if(this.var_187 > _loc1_ + this.var_1695 * (const_118 / 1000) && !this.var_750)
         {
            this.var_750 = true;
            if(this.var_503 != null)
            {
               this.var_503.reset();
               this.var_503.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            }
            this.var_503 = new Timer(2,1);
            this.var_503.start();
            this.var_503.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
         }
         else if(this.var_187 > _loc1_ - this.var_501 && !this.var_925)
         {
            this.var_1134 = false;
            this.var_925 = true;
            this.var_605 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > this.var_1392)
         {
            ++this.var_2198;
            Logger.log("Audio buffer under run...");
            this.var_1392 = param1.position;
         }
         if(this.volume > 0)
         {
            this.mixChannelsIntoBuffer();
         }
         var _loc2_:int = const_119;
         if(this.var_307 - this.var_187 < _loc2_)
         {
            _loc2_ = this.var_307 - this.var_187;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(this.volume <= 0)
         {
            _loc2_ = 0;
         }
         this.writeAudioToOutputStream(param1.data,_loc2_);
         this.var_187 += const_119;
         this.var_1392 += const_119;
         if(this.var_500 != null)
         {
            this.var_1695 = param1.position / const_118 * 1000 - this.var_500.position;
         }
         this.checkSongFinishing();
      }
      
      private function interpolate(param1:int, param2:Number) : int
      {
         var _loc4_:* = NaN;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc3_:* = 0;
         while(_loc10_ < param1)
         {
            _loc6_ = Math.floor(_loc3_);
            _loc7_ = Math.ceil(_loc3_);
            _loc4_ = 0;
            _loc5_ = 0;
            _loc8_ = _loc3_ - _loc6_;
            _loc9_ = _loc5_ - _loc4_;
            INTERPOLATION_BUFFER[_loc10_] = _loc4_ + _loc9_ * _loc8_;
            _loc3_ += param2;
            if(_loc3_ > const_119 - 2)
            {
               this.var_187 += const_119;
               this.mixChannelsIntoBuffer();
               _loc3_ = 0;
            }
            _loc10_++;
         }
         return int(Math.round(_loc3_));
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 > 0)
         {
            if(!this.var_1134 && !this.var_925)
            {
               this.writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(this.var_1134)
               {
                  _loc5_ = 1 / this.var_926;
                  _loc6_ = this.var_1133 / Number(this.var_926);
                  this.var_1133 += const_119;
                  if(this.var_1133 > this.var_926)
                  {
                     this.var_1134 = false;
                  }
               }
               else if(this.var_925)
               {
                  _loc5_ = -1 / this.var_501;
                  _loc6_ = 1 - this.var_605 / Number(this.var_501);
                  this.var_605 += const_119;
                  if(this.var_605 > this.var_501)
                  {
                     this.var_605 = this.var_501;
                  }
               }
               this.writeMixingBufferToOutputStreamWithFade(param1,param2,_loc6_,_loc5_);
            }
         }
         var _loc4_:int = param2;
         while(_loc4_ < const_119)
         {
            param1.writeFloat(0);
            param1.writeFloat(0);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = Number(Number(const_202[_loc4_]) * 0);
            param1.writeFloat(_loc3_);
            param1.writeFloat(_loc3_);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc5_ = Number(Number(const_202[_loc6_]) * 0 * param3);
            param3 += param4;
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
         if(param3 < 0)
         {
            while(_loc6_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc6_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc6_ < param2)
            {
               _loc5_ = Number(Number(const_202[_loc6_]) * 0);
               param3 += param4;
               param1.writeFloat(_loc5_);
               param1.writeFloat(_loc5_);
               _loc6_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(this.var_750)
         {
            this.playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         this.removeFadeoutStopTimer();
         this.playingComplete();
      }
      
      private function playingComplete() : void
      {
         this.stopImmediately();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.var_1698));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(this.var_749 != null)
         {
            this.var_749.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
            this.var_749.reset();
            this.var_749 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(this.var_503 != null)
         {
            this.var_503.reset();
            this.var_503.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            this.var_503 = null;
         }
      }
   }
}
