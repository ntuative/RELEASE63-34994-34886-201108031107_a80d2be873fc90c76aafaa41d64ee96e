package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1462:Number = 12;
       
      
      private var var_2366:int = -1;
      
      private var var_2369:int = -2;
      
      private var var_211:Vector3d = null;
      
      private var var_1182:Number = 0;
      
      private var var_1471:Number = 0;
      
      private var var_1779:Boolean = false;
      
      private var var_194:Vector3d = null;
      
      private var var_1781:Vector3d;
      
      private var var_2363:Boolean = false;
      
      private var var_2372:Boolean = false;
      
      private var var_2368:Boolean = false;
      
      private var var_2367:Boolean = false;
      
      private var var_2365:int = 0;
      
      private var var_2370:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2364:int = 0;
      
      private var var_2371:int = 0;
      
      private var var_1754:int = -1;
      
      private var var_1778:int = 0;
      
      private var var_1780:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1781 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_194;
      }
      
      public function get targetId() : int
      {
         return this.var_2366;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2369;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1781;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2363;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2372;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2368;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2367;
      }
      
      public function get method_2() : int
      {
         return this.var_2365;
      }
      
      public function get screenHt() : int
      {
         return this.var_2370;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2364;
      }
      
      public function get roomHt() : int
      {
         return this.var_2371;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1754;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_211 != null && this.var_194 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2366 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1781.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2369 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2363 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2372 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2368 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2367 = param1;
      }
      
      public function set method_2(param1:int) : void
      {
         this.var_2365 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1780 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2364 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2371 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1754 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_211 == null)
         {
            this.var_211 = new Vector3d();
         }
         if(this.var_211.x != param1.x || this.var_211.y != param1.y || this.var_211.z != param1.z)
         {
            this.var_211.assign(param1);
            this.var_1778 = 0;
            _loc2_ = Vector3d.dif(this.var_211,this.var_194);
            this.var_1182 = _loc2_.length;
            this.var_1779 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_211 = null;
         this.var_194 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_194 != null)
         {
            return;
         }
         this.var_194 = new Vector3d();
         this.var_194.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_194 == null)
         {
            this.var_194 = new Vector3d();
         }
         this.var_194.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_211 != null && this.var_194 != null)
         {
            ++this.var_1778;
            if(this.var_1780)
            {
               this.var_1780 = false;
               this.var_194 = this.var_211;
               this.var_211 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_211,this.var_194);
            if(_loc3_.length > this.var_1182)
            {
               this.var_1182 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_194 = this.var_211;
               this.var_211 = null;
               this.var_1471 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1182);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1182 / const_1462;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1779)
               {
                  if(_loc7_ < this.var_1471)
                  {
                     _loc7_ = this.var_1471;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1779 = false;
                  }
               }
               this.var_1471 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_194 = Vector3d.sum(this.var_194,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1754 = -1;
      }
   }
}
