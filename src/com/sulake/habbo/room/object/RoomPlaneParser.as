package com.sulake.habbo.room.object
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.geom.Point;
   
   public class RoomPlaneParser
   {
      
      private static const const_700:Number = 0.25;
      
      private static const const_1270:Number = 0.25;
      
      public static const const_60:int = -110;
      
      public static const const_218:int = -100;
       
      
      private var var_121:Array;
      
      private var var_568:Array;
      
      private var var_223:int = 0;
      
      private var _height:int = 0;
      
      private var _minX:int = 0;
      
      private var var_477:int = 0;
      
      private var var_478:int = 0;
      
      private var var_476:int = 0;
      
      private var var_153:Array;
      
      private var var_1590:Number = 0.0;
      
      private var var_1526:Number = 1.0;
      
      private var var_1042:Number = 1.0;
      
      private var var_1149:Number = 0.0;
      
      private var var_338:Map = null;
      
      private var var_569:Array;
      
      public function RoomPlaneParser()
      {
         this.var_121 = [];
         this.var_568 = [];
         this.var_153 = [];
         this.var_569 = [];
         super();
         this.var_1590 = 3.6;
         this.var_1526 = 1;
         this.var_1042 = 1;
         this.var_338 = new Map();
      }
      
      private static function getFloorHeight(param1:Array) : Number
      {
         var _loc8_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.length;
         if(_loc5_ == 0)
         {
            return 0;
         }
         var _loc7_:* = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc4_ = param1[_loc3_] as Array;
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               _loc8_ = Number(_loc4_[_loc2_]);
               if(_loc8_ > _loc7_)
               {
                  _loc7_ = Number(_loc8_);
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc7_;
      }
      
      private static function findEntranceTile(param1:Array) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.length;
         if(_loc5_ == 0)
         {
            return null;
         }
         var _loc6_:* = [];
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc4_ = param1[_loc3_] as Array;
            if(_loc4_ == null || _loc4_.length == 0)
            {
               return null;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               if(Number(_loc4_[_loc2_]) >= 0)
               {
                  _loc6_.push(_loc2_);
                  break;
               }
               _loc2_++;
            }
            if(_loc6_.length < _loc3_ + 1)
            {
               _loc6_.push(_loc4_.length + 1);
            }
            _loc3_++;
         }
         _loc3_ = 1;
         while(_loc3_ < _loc6_.length - 1)
         {
            if(int(_loc6_[_loc3_]) <= int(_loc6_[_loc3_ - 1]) - 1 && int(_loc6_[_loc3_]) <= int(_loc6_[_loc3_ + 1]) - 1)
            {
               return new Point(int(_loc6_[_loc3_]),_loc3_);
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get minX() : int
      {
         return this._minX;
      }
      
      public function get maxX() : int
      {
         return this.var_477;
      }
      
      public function get minY() : int
      {
         return this.var_478;
      }
      
      public function get maxY() : int
      {
         return this.var_476;
      }
      
      public function get tileMapWidth() : int
      {
         return this.var_223;
      }
      
      public function get tileMapHeight() : int
      {
         return this._height;
      }
      
      public function get planeCount() : int
      {
         return this.var_153.length;
      }
      
      public function get floorHeight() : Number
      {
         return this.var_1149;
      }
      
      public function get wallHeight() : Number
      {
         return this.var_1590;
      }
      
      public function set wallHeight(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.var_1590 = param1;
      }
      
      public function get wallThicknessMultiplier() : Number
      {
         return this.var_1526;
      }
      
      public function set wallThicknessMultiplier(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.var_1526 = param1;
      }
      
      public function get floorThicknessMultiplier() : Number
      {
         return this.var_1042;
      }
      
      public function set floorThicknessMultiplier(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.var_1042 = param1;
      }
      
      public function dispose() : void
      {
         this.var_153 = null;
         this.var_121 = null;
         this.var_568 = null;
         this.var_569 = null;
         if(this.var_338 != null)
         {
            this.var_338.dispose();
            this.var_338 = null;
         }
      }
      
      public function reset() : void
      {
         this.var_153 = [];
         this.var_121 = [];
         this.var_568 = [];
         this.var_121 = [];
         this.var_568 = [];
         this.var_223 = 0;
         this._height = 0;
         this._minX = 0;
         this.var_477 = 0;
         this.var_478 = 0;
         this.var_476 = 0;
         this.var_1149 = 0;
         this.var_569 = [];
      }
      
      public function initializeTileMap(param1:int, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         this.var_121 = [];
         this.var_568 = [];
         this.var_569 = [];
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc6_ = [];
            _loc7_ = 0;
            while(_loc7_ < param1)
            {
               _loc4_[_loc7_] = const_60;
               _loc5_[_loc7_] = const_60;
               _loc6_[_loc7_] = false;
               _loc7_++;
            }
            this.var_121.push(_loc4_);
            this.var_568.push(_loc5_);
            this.var_569.push(_loc6_);
            _loc3_++;
         }
         this.var_223 = param1;
         this._height = param2;
         this._minX = this.var_223;
         this.var_477 = -1;
         this.var_478 = this._height;
         this.var_476 = -1;
         return true;
      }
      
      public function setTileHeight(param1:int, param2:int, param3:Number) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         if(param1 >= 0 && param1 < this.var_223 && param2 >= 0 && param2 < this._height)
         {
            _loc4_ = this.var_121[param2] as Array;
            _loc4_[param1] = param3;
            if(param3 >= 0)
            {
               if(param1 < this._minX)
               {
                  this._minX = param1;
               }
               if(param1 > this.var_477)
               {
                  this.var_477 = param1;
               }
               if(param2 < this.var_478)
               {
                  this.var_478 = param2;
               }
               if(param2 > this.var_476)
               {
                  this.var_476 = param2;
               }
            }
            else
            {
               if(param1 == this._minX || param1 == this.var_477)
               {
                  _loc5_ = false;
                  _loc6_ = this.var_478;
                  while(_loc6_ < this.var_476)
                  {
                     if(this.getTileHeightInternal(param1,_loc6_) >= 0)
                     {
                        _loc5_ = true;
                        break;
                     }
                     _loc6_++;
                  }
                  if(!_loc5_)
                  {
                     if(param1 == this._minX)
                     {
                        ++this._minX;
                     }
                     if(param1 == this.var_477)
                     {
                        --this.var_477;
                     }
                  }
               }
               if(param2 == this.var_478 || param2 == this.var_476)
               {
                  _loc7_ = false;
                  _loc8_ = this._minX;
                  while(_loc8_ < this.var_477)
                  {
                     if(this.getTileHeight(_loc8_,param2) >= 0)
                     {
                        _loc7_ = true;
                        break;
                     }
                     _loc8_++;
                  }
                  if(!_loc7_)
                  {
                     if(param2 == this.var_478)
                     {
                        ++this.var_478;
                     }
                     if(param2 == this.var_476)
                     {
                        --this.var_476;
                     }
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.var_223 || param2 < 0 || param2 >= this._height)
         {
            return const_60;
         }
         var _loc3_:Array = this.var_121[param2] as Array;
         return Math.abs(_loc3_[param1] as Number);
      }
      
      private function getTileHeightOriginal(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.var_223 || param2 < 0 || param2 >= this._height)
         {
            return const_60;
         }
         if(this.var_569[param2][param1])
         {
            return const_218;
         }
         var _loc3_:Array = this.var_568[param2] as Array;
         return _loc3_[param1] as Number;
      }
      
      private function getTileHeightInternal(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.var_223 || param2 < 0 || param2 >= this._height)
         {
            return const_60;
         }
         var _loc3_:Array = this.var_121[param2] as Array;
         return _loc3_[param1] as Number;
      }
      
      public function initializeFromTileData(param1:Boolean = false) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this._height)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_223)
            {
               this.var_568[_loc3_][_loc2_] = this.var_121[_loc3_][_loc2_];
               _loc2_++;
            }
            _loc3_++;
         }
         var _loc4_:Point = findEntranceTile(this.var_121);
         _loc3_ = 0;
         while(_loc3_ < this._height)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_223)
            {
               if(this.var_569[_loc3_][_loc2_])
               {
                  this.var_121[_loc3_][_loc2_] = const_218;
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return this.initialize(_loc4_,param1);
      }
      
      private function initialize(param1:Point, param2:Boolean) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         if(param1 != null)
         {
            _loc3_ = this.getTileHeight(param1.x,param1.y);
            this.setTileHeight(param1.x,param1.y,const_60);
         }
         this.var_1149 = getFloorHeight(this.var_121);
         if(!param2)
         {
            this.createWallPlanes();
         }
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         while(_loc6_ < this.var_121.length)
         {
            _loc4_ = this.var_121[_loc6_];
            _loc7_ = [];
            _loc8_ = 0;
            while(_loc8_ < _loc4_.length)
            {
               _loc7_.push(_loc4_[_loc8_]);
               _loc8_++;
            }
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         while(this.extractFloorPlane(_loc5_,true))
         {
         }
         if(param1 != null)
         {
            this.setTileHeight(param1.x,param1.y,_loc3_);
            _loc4_ = _loc5_[param1.y];
            _loc4_[param1.x] = _loc3_;
            this.extractFloorPlane(_loc5_,false);
         }
         return true;
      }
      
      private function hidePeninsulaWallChains(param1:RoomWallData) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = param1.count;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_;
            _loc5_ = _loc2_;
            _loc6_ = 0;
            _loc7_ = false;
            while(!param1.getBorder(_loc2_) && _loc2_ < _loc3_)
            {
               if(param1.getLeftTurn(_loc2_))
               {
                  _loc6_++;
               }
               else if(_loc6_ > 0)
               {
                  _loc6_--;
               }
               if(_loc6_ > 1)
               {
                  _loc7_ = true;
               }
               _loc5_ = _loc2_;
               _loc2_++;
            }
            if(_loc7_)
            {
               _loc8_ = _loc4_;
               while(_loc8_ <= _loc5_)
               {
                  param1.setHideWall(_loc8_,true);
                  _loc8_++;
               }
            }
            _loc2_++;
         }
      }
      
      private function updateWallsNextToHoles(param1:RoomWallData) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = param1.count;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(!param1.getHideWall(_loc3_))
            {
               _loc4_ = param1.getCorner(_loc3_);
               _loc5_ = param1.getDirection(_loc3_);
               _loc6_ = param1.getLength(_loc3_);
               _loc7_ = RoomWallData.var_429[_loc5_];
               _loc8_ = RoomWallData.var_508[_loc5_];
               _loc9_ = 0;
               _loc10_ = 0;
               while(_loc10_ < _loc6_)
               {
                  if(this.getTileHeightInternal(_loc4_.x + _loc10_ * _loc7_.x - _loc8_.x,_loc4_.y + _loc10_ * _loc7_.y - _loc8_.y) == const_218)
                  {
                     if(_loc10_ > 0 && _loc9_ == 0)
                     {
                        param1.setLength(_loc3_,_loc10_);
                        break;
                     }
                     _loc9_++;
                  }
                  else if(_loc9_ > 0)
                  {
                     param1.moveCorner(_loc3_,_loc9_);
                     break;
                  }
                  _loc10_++;
               }
               if(_loc9_ == _loc6_)
               {
                  param1.setHideWall(_loc3_,true);
               }
            }
            _loc3_++;
         }
      }
      
      private function getWallEndPoints(param1:RoomWallData) : Array
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc2_:int = param1.count;
         var _loc3_:* = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1.getCorner(_loc4_);
            _loc6_ = new Point(_loc5_.x,_loc5_.y);
            _loc7_ = RoomWallData.var_429[param1.getDirection(_loc4_)];
            _loc8_ = param1.getLength(_loc4_);
            _loc6_.x += _loc7_.x * _loc8_;
            _loc6_.y += _loc7_.y * _loc8_;
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function hideOriginallyHiddenWalls(param1:RoomWallData, param2:RoomWallData) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc3_:int = param1.count;
         var _loc4_:int = param2.count;
         var _loc5_:Array = this.getWallEndPoints(param2);
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            if(!param1.getHideWall(_loc6_))
            {
               _loc7_ = param1.getCorner(_loc6_);
               _loc8_ = new Point(_loc7_.x,_loc7_.y);
               _loc9_ = RoomWallData.var_429[param1.getDirection(_loc6_)];
               _loc10_ = param1.getLength(_loc6_);
               _loc8_.x += _loc9_.x * _loc10_;
               _loc8_.y += _loc9_.y * _loc10_;
               _loc11_ = Math.min(_loc7_.y,_loc8_.y);
               _loc12_ = Math.max(_loc7_.y,_loc8_.y);
               _loc13_ = Math.min(_loc7_.x,_loc8_.x);
               _loc14_ = Math.max(_loc7_.x,_loc8_.x);
               _loc15_ = 0;
               while(_loc15_ < _loc4_)
               {
                  _loc16_ = param2.getCorner(_loc15_);
                  _loc17_ = _loc5_[_loc15_];
                  if(_loc7_.x == _loc8_.x)
                  {
                     if(_loc16_.x == _loc7_.x && _loc17_.x == _loc7_.x)
                     {
                        _loc18_ = Math.min(_loc16_.y,_loc17_.y);
                        _loc19_ = Math.max(_loc16_.y,_loc17_.y);
                        if(_loc18_ <= _loc11_ && _loc12_ <= _loc19_)
                        {
                           if(param2.getHideWall(_loc15_))
                           {
                              param1.setHideWall(_loc6_,true);
                           }
                           break;
                        }
                     }
                  }
                  else if(_loc7_.y == _loc8_.y)
                  {
                     if(_loc16_.y == _loc7_.y && _loc17_.y == _loc7_.y)
                     {
                        _loc20_ = Math.min(_loc16_.x,_loc17_.x);
                        _loc21_ = Math.max(_loc16_.x,_loc17_.x);
                        if(_loc20_ <= _loc13_ && _loc14_ <= _loc21_)
                        {
                           if(param2.getHideWall(_loc15_))
                           {
                              param1.setHideWall(_loc6_,true);
                           }
                           break;
                        }
                     }
                  }
                  _loc15_++;
               }
            }
            _loc6_++;
         }
      }
      
      private function checkWallHiding(param1:RoomWallData, param2:RoomWallData) : void
      {
         this.hidePeninsulaWallChains(param2);
         this.updateWallsNextToHoles(param1);
         this.hideOriginallyHiddenWalls(param1,param2);
      }
      
      private function generateWallData(param1:Point, param2:Boolean) : RoomWallData
      {
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc3_:RoomWallData = new RoomWallData();
         var _loc4_:Array = [this.extractTopWall,this.extractRightWall,this.extractBottomWall,this.extractLeftWall];
         var _loc5_:int = 0;
         var _loc6_:Point = new Point(param1.x,param1.y);
         var _loc7_:int = 0;
         while(_loc7_++ < 1000)
         {
            _loc8_ = false;
            _loc9_ = false;
            _loc10_ = _loc5_;
            if(_loc6_.x < this.minX || _loc6_.x > this.maxX || _loc6_.y < this.minY || _loc6_.y > this.maxY)
            {
               _loc8_ = true;
            }
            _loc11_ = _loc4_[_loc5_](_loc6_,param2);
            if(_loc11_ == null)
            {
               return null;
            }
            _loc12_ = Math.abs(_loc11_.x - _loc6_.x) + Math.abs(_loc11_.y - _loc6_.y);
            if(_loc6_.x == _loc11_.x || _loc6_.y == _loc11_.y)
            {
               _loc5_ = (_loc5_ - 1 + _loc4_.length) % _loc4_.length;
               _loc12_ += 1;
               _loc9_ = true;
            }
            else
            {
               _loc5_ = (_loc5_ + 1) % _loc4_.length;
               _loc12_--;
            }
            _loc3_.addWall(_loc6_,_loc10_,_loc12_,_loc8_,_loc9_);
            if(_loc11_.x == param1.x && _loc11_.y == param1.y && (_loc11_.x != _loc6_.x || _loc11_.y != _loc6_.y))
            {
               break;
            }
            _loc6_ = _loc11_;
         }
         if(_loc3_.count == 0)
         {
            return null;
         }
         return _loc3_;
      }
      
      private function createWallPlanes() : Boolean
      {
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc22_:Number = NaN;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:* = null;
         var _loc28_:Boolean = false;
         var _loc29_:Boolean = false;
         var _loc30_:Boolean = false;
         var _loc31_:Boolean = false;
         var _loc32_:Boolean = false;
         var _loc33_:Number = NaN;
         var _loc1_:Array = this.var_121;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = _loc1_.length;
         var _loc6_:int = 0;
         if(_loc5_ == 0)
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc4_ = _loc1_[_loc2_] as Array;
            if(_loc4_ == null || _loc4_.length == 0)
            {
               return false;
            }
            if(_loc6_ > 0)
            {
               _loc6_ = Math.min(_loc6_,_loc4_.length);
            }
            else
            {
               _loc6_ = _loc4_.length;
            }
            _loc2_++;
         }
         var _loc7_:Number = getFloorHeight(_loc1_);
         var _loc8_:int = this.minX;
         var _loc9_:int = this.minY;
         _loc9_ = this.minY;
         while(_loc9_ <= this.maxY)
         {
            if(this.getTileHeightInternal(_loc8_,_loc9_) > const_218)
            {
               _loc9_--;
               break;
            }
            _loc9_++;
         }
         var _loc10_:Point = new Point(_loc8_,_loc9_);
         var _loc11_:RoomWallData = this.generateWallData(_loc10_,true);
         var _loc12_:RoomWallData = this.generateWallData(_loc10_,false);
         if(_loc11_ != null)
         {
            _loc13_ = _loc11_.count;
            this.checkWallHiding(_loc11_,_loc12_);
            _loc2_ = 0;
            while(_loc2_ < _loc13_)
            {
               if(!_loc11_.getHideWall(_loc2_))
               {
                  _loc14_ = _loc11_.getCorner(_loc2_);
                  _loc15_ = _loc11_.getDirection(_loc2_);
                  _loc16_ = _loc11_.getLength(_loc2_);
                  _loc17_ = RoomWallData.var_429[_loc15_];
                  _loc18_ = RoomWallData.var_508[_loc15_];
                  _loc19_ = -1;
                  _loc3_ = 0;
                  while(_loc3_ < _loc16_)
                  {
                     _loc33_ = this.getTileHeightInternal(_loc14_.x + _loc3_ * _loc17_.x + _loc18_.x,_loc14_.y + _loc3_ * _loc17_.y + _loc18_.y);
                     if(_loc33_ >= 0 && (_loc33_ < _loc19_ || _loc19_ < 0))
                     {
                        _loc19_ = Number(_loc33_);
                     }
                     _loc3_++;
                  }
                  _loc20_ = _loc19_;
                  _loc21_ = new Vector3d(_loc14_.x,_loc14_.y,_loc20_);
                  _loc21_ = Vector3d.sum(_loc21_,Vector3d.product(_loc18_,0.5));
                  _loc21_ = Vector3d.sum(_loc21_,Vector3d.product(_loc17_,-0.5));
                  _loc22_ = this.wallHeight + _loc7_ - _loc19_;
                  _loc23_ = Vector3d.product(_loc17_,-_loc16_);
                  _loc24_ = new Vector3d(0,0,_loc22_);
                  _loc21_ = Vector3d.dif(_loc21_,_loc23_);
                  _loc25_ = _loc11_.getDirection((_loc2_ + 1) % _loc13_);
                  _loc26_ = _loc11_.getDirection((_loc2_ - 1 + _loc13_) % _loc13_);
                  _loc27_ = null;
                  if((_loc25_ - _loc15_ + 4) % 4 == 3)
                  {
                     _loc27_ = RoomWallData.var_508[_loc25_];
                  }
                  else if((_loc15_ - _loc26_ + 4) % 4 == 3)
                  {
                     _loc27_ = RoomWallData.var_508[_loc26_];
                  }
                  _loc28_ = _loc11_.getLeftTurn(_loc2_);
                  _loc29_ = _loc11_.getLeftTurn((_loc2_ - 1 + _loc13_) % _loc13_);
                  _loc30_ = _loc11_.getHideWall((_loc2_ + 1) % _loc13_);
                  _loc31_ = _loc11_.getManuallyLeftCut(_loc2_);
                  _loc32_ = _loc11_.getManuallyRightCut(_loc2_);
                  this.addWall(_loc21_,_loc23_,_loc24_,_loc27_,!_loc29_ || _loc31_,!_loc28_ || _loc32_,!_loc30_);
               }
               _loc2_++;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < this.tileMapHeight)
         {
            _loc2_ = 0;
            while(_loc2_ < this.tileMapWidth)
            {
               if(this.getTileHeightInternal(_loc2_,_loc3_) < 0)
               {
                  this.setTileHeight(_loc2_,_loc3_,-(_loc7_ + this.wallHeight));
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function extractTopWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = const_218;
         if(!param2)
         {
            _loc4_ = const_60;
         }
         while(_loc3_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x + _loc3_,param1.y) > _loc4_)
            {
               return new Point(param1.x + _loc3_ - 1,param1.y);
            }
            if(this.getTileHeightInternal(param1.x + _loc3_,param1.y + 1) <= _loc4_)
            {
               return new Point(param1.x + _loc3_,param1.y + 1);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function extractRightWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = const_218;
         if(!param2)
         {
            _loc4_ = const_60;
         }
         while(_loc3_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x,param1.y + _loc3_) > _loc4_)
            {
               return new Point(param1.x,param1.y + (_loc3_ - 1));
            }
            if(this.getTileHeightInternal(param1.x - 1,param1.y + _loc3_) <= _loc4_)
            {
               return new Point(param1.x - 1,param1.y + _loc3_);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function extractBottomWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = const_218;
         if(!param2)
         {
            _loc4_ = const_60;
         }
         while(_loc3_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x - _loc3_,param1.y) > _loc4_)
            {
               return new Point(param1.x - (_loc3_ - 1),param1.y);
            }
            if(this.getTileHeightInternal(param1.x - _loc3_,param1.y - 1) <= _loc4_)
            {
               return new Point(param1.x - _loc3_,param1.y - 1);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function extractLeftWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = const_218;
         if(!param2)
         {
            _loc4_ = const_60;
         }
         while(_loc3_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x,param1.y - _loc3_) > _loc4_)
            {
               return new Point(param1.x,param1.y - (_loc3_ - 1));
            }
            if(this.getTileHeightInternal(param1.x + 1,param1.y - _loc3_) <= _loc4_)
            {
               return new Point(param1.x + 1,param1.y - _loc3_);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function addWall(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Boolean, param6:Boolean, param7:Boolean) : void
      {
         var _loc12_:* = null;
         this.addPlane(RoomPlaneData.const_264,param1,param2,param3,[param4]);
         this.addPlane(RoomPlaneData.const_402,param1,param2,param3,[param4]);
         var _loc8_:Number = const_1270 * this.var_1526;
         var _loc9_:Number = const_700 * this.var_1042;
         var _loc10_:Vector3d = Vector3d.crossProduct(param2,param3);
         var _loc11_:Vector3d = Vector3d.product(_loc10_,1 / _loc10_.length * -_loc8_);
         this.addPlane(RoomPlaneData.const_264,Vector3d.sum(param1,param3),param2,_loc11_,[_loc10_,param4]);
         if(param5)
         {
            this.addPlane(RoomPlaneData.const_264,Vector3d.sum(Vector3d.sum(param1,param2),param3),Vector3d.product(param3,-(param3.length + _loc9_) / param3.length),_loc11_,[_loc10_,param4]);
         }
         if(param6)
         {
            this.addPlane(RoomPlaneData.const_264,Vector3d.sum(param1,Vector3d.product(param3,-_loc9_ / param3.length)),Vector3d.product(param3,(param3.length + _loc9_) / param3.length),_loc11_,[_loc10_,param4]);
            if(param7)
            {
               _loc12_ = Vector3d.product(param2,_loc8_ / param2.length);
               this.addPlane(RoomPlaneData.const_264,Vector3d.sum(Vector3d.sum(param1,param3),Vector3d.product(_loc12_,-1)),_loc12_,_loc11_,[_loc10_,param2,param4]);
            }
         }
      }
      
      private function findFloorRectangle(param1:Array, param2:int, param3:int) : RoomFloorRectangle
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = param2;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = -1;
         var _loc13_:* = 0;
         _loc5_ = 0;
         while(_loc5_ < param3)
         {
            _loc6_ = param1[_loc5_] as Array;
            _loc7_ = param1[_loc10_] as Array;
            if(_loc12_ >= 0)
            {
               if(_loc8_ > 0 && Number(_loc6_[_loc8_ - 1]) != Number(_loc7_[_loc8_ - 1]))
               {
                  _loc11_ = _loc5_;
                  break;
               }
               if(_loc9_ < param2 && _loc6_[_loc9_] != Number(_loc7_[_loc9_]))
               {
                  _loc11_ = _loc5_;
                  break;
               }
            }
            _loc4_ = _loc8_;
            while(_loc4_ < _loc9_)
            {
               _loc13_ = Number(Number(_loc6_[_loc4_]));
               if(_loc13_ >= 0)
               {
                  if(_loc12_ < 0)
                  {
                     _loc10_ = _loc5_;
                     _loc8_ = _loc4_;
                     _loc12_ = Number(_loc13_);
                  }
                  else if(_loc13_ != _loc12_)
                  {
                     if(_loc5_ > _loc10_)
                     {
                        _loc11_ = _loc5_;
                        _loc5_ = param3;
                        break;
                     }
                     _loc9_ = _loc4_;
                  }
               }
               else if(_loc12_ >= 0)
               {
                  if(_loc5_ == _loc10_)
                  {
                     _loc9_ = _loc4_;
                  }
                  else if(_loc4_ < _loc9_)
                  {
                     _loc11_ = _loc5_;
                     _loc5_ = param3;
                     break;
                  }
               }
               _loc11_ = _loc5_ + 1;
               _loc4_++;
            }
            _loc5_++;
         }
         if(_loc12_ < 0)
         {
            return null;
         }
         if(_loc9_ - _loc8_ < 1)
         {
            return null;
         }
         if(_loc11_ - _loc10_ < 1)
         {
            return null;
         }
         if(_loc10_ > 0)
         {
            _loc7_ = param1[_loc10_ - 1];
         }
         else
         {
            _loc7_ = null;
         }
         _loc6_ = param1[_loc11_];
         _loc4_ = _loc8_ + 1;
         while(_loc4_ < _loc9_)
         {
            if(_loc6_ != null && _loc6_[_loc4_] >= -1 != _loc6_[_loc8_] >= -1 || _loc7_ != null && _loc7_[_loc4_] >= -1 != _loc7_[_loc8_] >= -1)
            {
               _loc9_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         _loc7_ = param1[_loc10_];
         _loc4_ = _loc10_ + 1;
         while(_loc4_ < _loc11_)
         {
            _loc6_ = param1[_loc4_];
            if(_loc8_ > 0 && _loc6_[_loc8_ - 1] >= -1 != _loc7_[_loc8_ - 1] >= -1 || _loc9_ < param2 && _loc6_[_loc9_] >= -1 != _loc7_[_loc9_] >= -1)
            {
               _loc11_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return new RoomFloorRectangle(_loc8_,_loc10_,_loc9_,_loc11_,_loc12_);
      }
      
      private function getHeightMapWidth(param1:Array) : int
      {
         var _loc2_:int = param1.length;
         if(_loc2_ == 0)
         {
            return 0;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            _loc3_ = param1[_loc6_] as Array;
            _loc4_ = this.var_121[_loc6_] as Array;
            if(_loc3_ == null || _loc3_.length == 0)
            {
               return 0;
            }
            if(_loc4_ == null || _loc4_.length == 0)
            {
               return 0;
            }
            if(_loc3_.length != _loc4_.length)
            {
               return 0;
            }
            if(_loc5_ > 0)
            {
               if(_loc3_.length < _loc5_)
               {
                  _loc5_ = _loc3_.length;
               }
            }
            else
            {
               _loc5_ = _loc3_.length;
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      private function getHorizontalStairInfo(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number) : RoomStairData
      {
         var _loc15_:int = 0;
         var _loc8_:int = 1;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(param4 < 0)
         {
            _loc8_ = 0;
         }
         if(param4 > param6 - 1)
         {
            _loc8_ = 0;
         }
         var _loc12_:int = param1;
         while(_loc12_ < param2)
         {
            if(_loc8_)
            {
               _loc15_ = Math.abs(this.getTileHeightInternal(_loc12_,param4) - this.getTileHeightInternal(_loc12_,param3));
               if(_loc15_ != 1)
               {
                  _loc8_ = 0;
               }
               else
               {
                  _loc8_ = this.getTileHeightInternal(_loc12_,param4) - this.getTileHeightInternal(_loc12_,param3);
               }
            }
            if(!_loc9_ && this.getTileHeightInternal(_loc12_,param4) < param7)
            {
               _loc9_ = true;
            }
            _loc12_++;
         }
         var _loc13_:int = param1 - 1;
         var _loc14_:int = param2 + 1;
         _loc12_ = param1 - 1;
         while(_loc12_ >= _loc13_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(_loc12_,param4) - this.getTileHeightOriginal(_loc12_,param3));
            if(_loc15_ == 1)
            {
               _loc10_ = true;
            }
            _loc12_--;
         }
         _loc12_ = param2;
         while(_loc12_ < _loc14_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(_loc12_,param4) - this.getTileHeightOriginal(_loc12_,param3));
            if(_loc15_ == 1)
            {
               _loc11_ = true;
            }
            _loc12_++;
         }
         return new RoomStairData(_loc8_,_loc10_,_loc11_,_loc9_);
      }
      
      private function getVerticalStairInfo(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number) : RoomStairData
      {
         var _loc15_:int = 0;
         var _loc8_:int = 1;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(param4 < 0)
         {
            _loc8_ = 0;
         }
         if(param4 > param5 - 2)
         {
            _loc8_ = 0;
         }
         var _loc12_:int = param1;
         while(_loc12_ < param2)
         {
            if(_loc8_)
            {
               _loc15_ = Math.abs(this.getTileHeightInternal(param4,_loc12_) - this.getTileHeightInternal(param3,_loc12_));
               if(_loc15_ != 1)
               {
                  _loc8_ = 0;
               }
               else
               {
                  _loc8_ = this.getTileHeightInternal(param4,_loc12_) - this.getTileHeightInternal(param3,_loc12_);
               }
            }
            if(!_loc9_ && this.getTileHeightInternal(param4,_loc12_) < param7)
            {
               _loc9_ = true;
            }
            _loc12_++;
         }
         var _loc13_:int = param1 - 1;
         var _loc14_:int = param2 + 1;
         _loc12_ = param1 - 1;
         while(_loc12_ >= _loc13_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(param4,_loc12_) - this.getTileHeightOriginal(param3,_loc12_));
            if(_loc15_ == 1)
            {
               _loc10_ = true;
            }
            _loc12_--;
         }
         _loc12_ = param2;
         while(_loc12_ < _loc14_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(param4,_loc12_) - this.getTileHeightOriginal(param3,_loc12_));
            if(_loc15_ == 1)
            {
               _loc11_ = true;
            }
            _loc12_++;
         }
         return new RoomStairData(_loc8_,_loc10_,_loc11_,_loc9_);
      }
      
      private function extractFloorPlane(param1:Array, param2:Boolean) : Boolean
      {
         var _loc18_:Boolean = false;
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc21_:Boolean = false;
         if(param1 == null || this.var_121 == null || param1 == this.var_121)
         {
            return false;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(param1.length > this.var_121.length)
         {
            return false;
         }
         var _loc6_:int = param1.length;
         if(_loc6_ == 0)
         {
            return false;
         }
         var _loc7_:int = this.getHeightMapWidth(param1);
         if(_loc7_ == 0)
         {
            return false;
         }
         var _loc8_:RoomFloorRectangle = this.findFloorRectangle(param1,_loc7_,_loc6_);
         if(_loc8_ == null)
         {
            return false;
         }
         var _loc9_:Number = _loc8_.right - _loc8_.left;
         var _loc10_:Number = _loc8_.bottom - _loc8_.top;
         var _loc11_:Number = _loc8_.altitude;
         var _loc12_:Number = _loc8_.left - 0.5;
         var _loc13_:Number = _loc8_.top - 0.5;
         var _loc14_:RoomStairData = this.getHorizontalStairInfo(_loc8_.left,_loc8_.right,_loc8_.top,_loc8_.top - 1,_loc7_,_loc6_,_loc11_);
         var _loc15_:RoomStairData = this.getHorizontalStairInfo(_loc8_.left,_loc8_.right,_loc8_.bottom - 1,_loc8_.bottom,_loc7_,_loc6_,_loc11_);
         var _loc16_:RoomStairData = this.getVerticalStairInfo(_loc8_.top,_loc8_.bottom,_loc8_.left,_loc8_.left - 1,_loc7_,_loc6_,_loc11_);
         var _loc17_:RoomStairData = this.getVerticalStairInfo(_loc8_.top,_loc8_.bottom,_loc8_.right - 1,_loc8_.right,_loc7_,_loc6_,_loc11_);
         if(_loc14_.stairHeight)
         {
            if(_loc14_.stairHeight > 0)
            {
               _loc18_ = false;
               _loc19_ = true;
            }
            else
            {
               _loc18_ = true;
               _loc19_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + 0.34,_loc11_ + _loc14_.stairHeight / 4 * 2),new Vector3d(-_loc9_,0,0),new Vector3d(0,-0.34,0),_loc17_.border || !_loc14_.neighbourStairMax,_loc16_.border || !_loc14_.neighbourStairMin,_loc19_,_loc18_,0,0,0,0,false,true);
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + 0.67,_loc11_ + _loc14_.stairHeight / 4),new Vector3d(-_loc9_,0,0),new Vector3d(0,-0.33,0),_loc17_.border || !_loc14_.neighbourStairMax,_loc16_.border || !_loc14_.neighbourStairMin,_loc19_,_loc18_,0,0,0,0,false,true);
         }
         if(_loc15_.stairHeight)
         {
            if(_loc15_.stairHeight < 0)
            {
               _loc18_ = false;
               _loc19_ = true;
            }
            else
            {
               _loc18_ = true;
               _loc19_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + _loc10_,_loc11_ + _loc15_.stairHeight / 4),new Vector3d(-_loc9_,0,0),new Vector3d(0,-0.33,0),_loc17_.border || !_loc15_.neighbourStairMax,_loc16_.border || !_loc15_.neighbourStairMin,_loc19_,_loc18_,0,0,0,0,false,true);
         }
         if(_loc16_.stairHeight)
         {
            if(_loc16_.stairHeight > 0)
            {
               _loc20_ = false;
               _loc21_ = true;
            }
            else
            {
               _loc20_ = true;
               _loc21_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + 0.34,_loc13_ + _loc10_,_loc11_ + _loc16_.stairHeight / 4 * 2),new Vector3d(-0.34,0,0),new Vector3d(0,-_loc10_,0),_loc21_,_loc20_,_loc15_.border || !_loc16_.neighbourStairMax,_loc14_.border || !_loc16_.neighbourStairMin,0,0,0,0,true,false);
            this.addFloor(new Vector3d(_loc12_ + 0.67,_loc13_ + _loc10_,_loc11_ + _loc16_.stairHeight / 4),new Vector3d(-0.33,0,0),new Vector3d(0,-_loc10_,0),_loc21_,_loc20_,_loc15_.border || !_loc16_.neighbourStairMax,_loc14_.border || !_loc16_.neighbourStairMin,0,0,0,0,true,false);
         }
         if(_loc17_.stairHeight)
         {
            if(_loc17_.stairHeight < 0)
            {
               _loc20_ = false;
               _loc21_ = true;
            }
            else
            {
               _loc20_ = true;
               _loc21_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + _loc10_,_loc11_ + _loc17_.stairHeight / 4),new Vector3d(-0.33,0,0),new Vector3d(0,-_loc10_,0),_loc21_,_loc20_,_loc15_.border || !_loc17_.neighbourStairMax,_loc14_.border || !_loc17_.neighbourStairMin,0,0,0,0,true,false);
         }
         _loc4_ = _loc8_.top;
         while(_loc4_ < _loc8_.bottom)
         {
            _loc5_ = param1[_loc4_];
            _loc3_ = _loc8_.left;
            while(_loc3_ < _loc8_.right)
            {
               _loc5_[_loc3_] = -1;
               _loc3_++;
            }
            _loc4_++;
         }
         var _loc22_:* = 0;
         var _loc23_:* = 0;
         var _loc24_:* = 0;
         var _loc25_:* = 0;
         if(_loc16_.stairHeight || _loc16_.neighbourStair)
         {
            _loc23_ = 0.65;
         }
         if(_loc17_.stairHeight || _loc17_.neighbourStair)
         {
            _loc22_ = 0.3;
         }
         if(_loc14_.stairHeight || _loc14_.neighbourStair)
         {
            _loc25_ = 0.65;
         }
         if(_loc15_.stairHeight || _loc15_.neighbourStair)
         {
            _loc24_ = 0.3;
         }
         this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + _loc10_,_loc11_),new Vector3d(-_loc9_,0,0),new Vector3d(0,-_loc10_,0),_loc17_.border && param2,_loc16_.border && param2,_loc15_.border && param2,_loc14_.border && param2,_loc22_,_loc23_,_loc24_,_loc25_,false,false);
         return true;
      }
      
      private function addFloor(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean, param8:Number, param9:Number, param10:Number, param11:Number, param12:Boolean, param13:Boolean) : void
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc14_:RoomPlaneData = this.addPlane(RoomPlaneData.const_293,param1,param2,param3);
         var _loc15_:IVector3d = param1;
         var _loc16_:* = null;
         var _loc17_:* = null;
         if(_loc14_)
         {
            _loc18_ = const_700 * this.var_1042;
            _loc19_ = _loc18_;
            if(this.var_1042 > 1)
            {
               _loc19_ = const_700;
            }
            if(param8 > 0)
            {
               _loc14_.addMask(0,0,param8 - 0.02,param3.length);
            }
            if(param9 > 0)
            {
               _loc14_.addMask(param2.length - param9,0,param9,param3.length);
            }
            if(param10 > 0)
            {
               _loc14_.addMask(0,0,param2.length,param10 - 0.02);
            }
            if(param11 > 0)
            {
               _loc14_.addMask(0,param3.length - param11,param2.length,param11);
            }
            if(param6)
            {
               if(param10 > 0 || param13)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.product(param3,param10 / param3.length));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = param1;
                  _loc20_ = _loc18_;
               }
               _loc16_ = this.addPlane(RoomPlaneData.const_293,_loc15_,new Vector3d(0,0,-_loc20_),param2);
               if(_loc16_ != null)
               {
                  if(param8 > 0)
                  {
                     _loc16_.addMask(0,0,_loc18_,param8);
                  }
                  if(param9 > 0)
                  {
                     _loc16_.addMask(0,param2.length - param9,_loc18_,param9);
                  }
               }
            }
            if(param7)
            {
               if(param11 > 0 || param13)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.sum(param2,Vector3d.product(param3,1 - param11 / param3.length)));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.sum(param2,param3));
                  _loc20_ = _loc18_;
               }
               _loc16_ = this.addPlane(RoomPlaneData.const_293,_loc15_,new Vector3d(0,0,-_loc20_),Vector3d.product(param2,-1));
               if(_loc16_ != null)
               {
                  if(param9 > 0)
                  {
                     _loc16_.addMask(0,0,_loc18_,param9);
                  }
                  if(param8 > 0)
                  {
                     _loc16_.addMask(0,param2.length - param8,_loc18_,param8);
                  }
               }
            }
            if(param4)
            {
               if(param8 > 0 || param12)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.sum(param3,Vector3d.product(param2,param8 / param2.length)));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = Vector3d.sum(param1,param3);
                  _loc20_ = _loc18_;
               }
               _loc17_ = this.addPlane(RoomPlaneData.const_293,_loc15_,new Vector3d(0,0,-_loc20_),Vector3d.product(param3,-1));
               if(_loc17_ != null)
               {
                  if(param11 > 0)
                  {
                     _loc17_.addMask(0,0,_loc18_,param11);
                  }
                  if(param10 > 0)
                  {
                     _loc17_.addMask(0,param3.length - param10,_loc18_,param10);
                  }
               }
            }
            if(param5)
            {
               if(param9 > 0 || param12)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.product(param2,1 - param9 / param2.length));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = Vector3d.sum(param1,param2);
                  _loc20_ = _loc18_;
               }
               _loc17_ = this.addPlane(RoomPlaneData.const_293,_loc15_,new Vector3d(0,0,-_loc20_),param3);
               if(_loc17_ != null)
               {
                  if(param10 > 0)
                  {
                     _loc17_.addMask(0,0,_loc18_,param10);
                  }
                  if(param11 > 0)
                  {
                     _loc17_.addMask(0,param3.length - param11,_loc18_,param11);
                  }
               }
            }
         }
      }
      
      public function initializeFromXML(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         if(param1 == null)
         {
            return false;
         }
         this.reset();
         this.resetFloorHoles();
         if(!XMLValidator.checkRequiredAttributes(param1.tileMap[0],["width","height","wallHeight"]))
         {
            return false;
         }
         var _loc2_:int = parseInt(param1.tileMap.@width);
         var _loc3_:int = parseInt(param1.tileMap.@height);
         var _loc4_:Number = parseFloat(param1.tileMap.@wallHeight);
         this.initializeTileMap(_loc2_,_loc3_);
         var _loc5_:XMLList = param1.tileMap.tileRow;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length())
         {
            _loc7_ = _loc5_[_loc6_];
            _loc8_ = _loc7_.tile;
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length())
            {
               _loc10_ = _loc8_[_loc9_];
               _loc11_ = parseFloat(_loc10_.@height);
               this.setTileHeight(_loc9_,_loc6_,_loc11_);
               _loc9_++;
            }
            _loc6_++;
         }
         if(param1.holeMap.length() > 0)
         {
            _loc12_ = param1.holeMap[0];
            _loc13_ = _loc12_.hole;
            _loc14_ = 0;
            while(_loc14_ < _loc13_.length())
            {
               _loc15_ = _loc13_[_loc14_];
               if(XMLValidator.checkRequiredAttributes(_loc15_,["id","x","y","width","height"]))
               {
                  this.addFloorHole(_loc15_.@id,_loc15_.@x,_loc15_.@y,_loc15_.@width,_loc15_.@height);
               }
               _loc14_++;
            }
            this.initializeHoleMap();
         }
         this.wallHeight = _loc4_;
         this.initializeFromTileData();
         return true;
      }
      
      private function addPlane(param1:int, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Array = null) : RoomPlaneData
      {
         if(param3.length == 0 || param4.length == 0)
         {
            return null;
         }
         var _loc6_:RoomPlaneData = new RoomPlaneData(param1,param2,param3,param4,param5);
         this.var_153.push(_loc6_);
         return _loc6_;
      }
      
      public function getXML() : XML
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc1_:XML = <tileMap width="{this.var_223}" height="{this._height}" wallHeight="{this.var_1590}"/>;
         var _loc2_:int = 0;
         while(_loc2_ < this._height)
         {
            _loc7_ = <tileRow/>;
            _loc8_ = this.var_568[_loc2_];
            _loc9_ = 0;
            while(_loc9_ < this.var_223)
            {
               _loc10_ = _loc8_[_loc9_];
               _loc11_ = <tile height="{_loc10_}"/>;
               _loc7_.appendChild(_loc11_);
               _loc9_++;
            }
            _loc1_.appendChild(_loc7_);
            _loc2_++;
         }
         var _loc3_:XML = <holeMap/>;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_338.length)
         {
            _loc12_ = this.var_338.getWithIndex(_loc4_);
            if(_loc12_ != null)
            {
               _loc13_ = this.var_338.getKey(_loc4_);
               _loc14_ = <hole id="{_loc13_}" x="{_loc12_.x}" y="{_loc12_.y}" width="{_loc12_.width}" height="{_loc12_.height}"/>;
               _loc3_.appendChild(_loc14_);
            }
            _loc4_++;
         }
         var _loc5_:XML = <roomData/>;
         _loc5_.appendChild(_loc1_);
         _loc5_.appendChild(_loc3_);
         var _loc6_:XML = <dimensions minX="{this.minX}" maxX="{this.maxX}" minY="{this.minY}" maxY="{this.maxY}"/>;
         _loc5_.appendChild(_loc6_);
         return _loc5_;
      }
      
      public function getPlaneLocation(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.loc;
         }
         return null;
      }
      
      public function getPlaneNormal(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.normal;
         }
         return null;
      }
      
      public function getPlaneLeftSide(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.leftSide;
         }
         return null;
      }
      
      public function getPlaneRightSide(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.rightSide;
         }
         return null;
      }
      
      public function getPlaneNormalDirection(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.normalDirection;
         }
         return null;
      }
      
      public function getPlaneSecondaryNormals(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _loc2_.secondaryNormalCount)
            {
               _loc3_.push(_loc2_.getSecondaryNormal(_loc4_));
               _loc4_++;
            }
            return _loc3_;
         }
         return null;
      }
      
      public function getPlaneType(param1:int) : int
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return RoomPlaneData.const_1398;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.type;
         }
         return RoomPlaneData.const_1398;
      }
      
      public function getPlaneMaskCount(param1:int) : int
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return 0;
         }
         var _loc2_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.maskCount;
         }
         return 0;
      }
      
      public function getPlaneMaskLeftSideLoc(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskLeftSideLoc(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskRightSideLoc(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskRightSideLoc(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskLeftSideLength(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskLeftSideLength(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskRightSideLength(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_153[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskRightSideLength(param2);
         }
         return -1;
      }
      
      public function addFloorHole(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.removeFloorHole(param1);
         var _loc6_:RoomFloorHole = new RoomFloorHole(param2,param3,param4,param5);
         this.var_338.add(param1,_loc6_);
      }
      
      public function removeFloorHole(param1:int) : void
      {
         this.var_338.remove(param1);
      }
      
      public function resetFloorHoles() : void
      {
         this.var_338.reset();
      }
      
      private function initializeHoleMap() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this._height)
         {
            _loc3_ = this.var_569[_loc2_];
            _loc1_ = 0;
            while(_loc1_ < this.var_223)
            {
               _loc3_[_loc1_] = false;
               _loc1_++;
            }
            _loc2_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_338.length)
         {
            _loc5_ = this.var_338.getWithIndex(_loc4_);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.x;
               _loc7_ = _loc5_.x + _loc5_.width - 1;
               _loc8_ = _loc5_.y;
               _loc9_ = _loc5_.y + _loc5_.height - 1;
               _loc6_ = _loc6_ < 0 ? 0 : int(_loc6_);
               _loc7_ = _loc7_ >= this.var_223 ? int(this.var_223 - 1) : int(_loc7_);
               _loc8_ = _loc8_ < 0 ? 0 : int(_loc8_);
               _loc9_ = _loc9_ >= this._height ? int(this._height - 1) : int(_loc9_);
               _loc2_ = _loc8_;
               while(_loc2_ <= _loc9_)
               {
                  _loc3_ = this.var_569[_loc2_];
                  _loc1_ = _loc6_;
                  while(_loc1_ <= _loc7_)
                  {
                     _loc3_[_loc1_] = true;
                     _loc1_++;
                  }
                  _loc2_++;
               }
            }
            _loc4_++;
         }
      }
   }
}
