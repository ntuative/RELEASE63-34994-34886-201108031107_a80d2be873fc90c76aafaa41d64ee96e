package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var _configuration:IHabboConfigurationManager = null;
      
      private var var_620:int = 0;
      
      private var var_534:Number = 0;
      
      private var var_3092:Array;
      
      private var var_1503:String = "";
      
      private var var_1827:String = "";
      
      private var var_2415:String = "";
      
      private var var_2414:String = "";
      
      private var var_1806:Boolean = false;
      
      private var var_1829:GarbageMonitor = null;
      
      private var var_1502:int = 0;
      
      private var var_2447:Boolean;
      
      private var var_1828:int = 1000;
      
      private var var_1501:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1826:int = 0;
      
      private var var_1830:int = 10;
      
      private var var_1504:int = 0;
      
      private var var_2446:Number = 0.15;
      
      private var var_2448:Boolean = true;
      
      private var var_2449:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_3092 = [];
         super();
         this.var_1827 = Capabilities.version;
         this.var_2415 = Capabilities.os;
         this.var_1806 = Capabilities.isDebugger;
         this.var_1503 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1503 == null)
         {
            this.var_1503 = "unknown";
         }
         this.var_1829 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1826 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1827;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_534;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1828 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1830 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this._configuration = param1;
         this._reportInterval = int(this._configuration.getKey("performancetest.interval","60"));
         this.var_1828 = int(this._configuration.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1830 = int(this._configuration.getKey("performancetest.reportlimit","10"));
         this.var_2446 = Number(this._configuration.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2448 = Boolean(int(this._configuration.getKey("performancetest.distribution.enabled","1")));
         this.var_2447 = Boolean(this._configuration.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1829.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1829.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         if(this.var_2447)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1502;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1828)
         {
            ++this.var_1501;
            _loc3_ = true;
         }
         else
         {
            ++this.var_620;
            if(this.var_620 <= 1)
            {
               this.var_534 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_620);
               this.var_534 = this.var_534 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1826 > this._reportInterval * 1000 && this.var_1504 < this.var_1830)
         {
            _loc6_ = 0;
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_534 + "/s, system memory usage : " + _loc6_ + " bytes");
            _loc7_ = true;
            if(this.var_2448 && this.var_1504 > 0)
            {
               _loc8_ = this.differenceInPercents(this.var_2449,this.var_534);
               if(_loc8_ < this.var_2446)
               {
                  _loc7_ = false;
               }
            }
            this.var_1826 = param2;
            if(_loc7_ || _loc3_)
            {
               this.var_2449 = this.var_534;
               if(this.sendReport(param2))
               {
                  ++this.var_1504;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1503,this.var_1827,this.var_2415,this.var_2414,this.var_1806,_loc5_,_loc4_,this.var_1502,this.var_534,this.var_1501);
            this._connection.send(_loc2_);
            this.var_1502 = 0;
            this.var_534 = 0;
            this.var_620 = 0;
            this.var_1501 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
