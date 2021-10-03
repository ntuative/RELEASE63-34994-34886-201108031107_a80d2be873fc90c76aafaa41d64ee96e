package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.geom.Point;
   
   public class RoomWallData
   {
      
      public static var var_429:Array = [];
      
      public static var var_508:Array = [];
      
      {
         var_429.push(new Vector3d(1,0,0));
         var_429.push(new Vector3d(0,1,0));
         var_429.push(new Vector3d(-1,0,0));
         var_429.push(new Vector3d(0,-1,0));
         var_508.push(new Vector3d(0,1,0));
         var_508.push(new Vector3d(-1,0,0));
         var_508.push(new Vector3d(0,-1,0));
         var_508.push(new Vector3d(1,0,0));
      }
      
      private var var_1176:Array;
      
      private var directions:Array;
      
      private var var_630:Array;
      
      private var var_1756:Array;
      
      private var borders:Array;
      
      private var hideWalls:Array;
      
      private var manuallyLeftCut:Array;
      
      private var manuallyRightCut:Array;
      
      private var var_1755:int = 0;
      
      public function RoomWallData()
      {
         this.var_1176 = [];
         this.directions = [];
         this.var_630 = [];
         this.var_1756 = [];
         this.borders = [];
         this.hideWalls = [];
         this.manuallyLeftCut = [];
         this.manuallyRightCut = [];
         super();
      }
      
      public function addWall(param1:Point, param2:int, param3:int, param4:Boolean, param5:Boolean) : void
      {
         this.var_1176.push(param1);
         this.directions.push(param2);
         this.var_630.push(param3);
         this.borders.push(param4);
         this.var_1756.push(param5);
         this.hideWalls.push(false);
         this.manuallyLeftCut.push(false);
         this.manuallyRightCut.push(false);
         ++this.var_1755;
      }
      
      public function get count() : int
      {
         return this.var_1755;
      }
      
      public function getCorner(param1:int) : Point
      {
         return this.var_1176[param1];
      }
      
      public function getLength(param1:int) : int
      {
         return this.var_630[param1];
      }
      
      public function getDirection(param1:int) : int
      {
         return this.directions[param1];
      }
      
      public function getBorder(param1:int) : Boolean
      {
         return this.borders[param1];
      }
      
      public function getHideWall(param1:int) : Boolean
      {
         return this.hideWalls[param1];
      }
      
      public function getLeftTurn(param1:int) : Boolean
      {
         return this.var_1756[param1];
      }
      
      public function getManuallyLeftCut(param1:int) : Boolean
      {
         return this.manuallyLeftCut[param1];
      }
      
      public function getManuallyRightCut(param1:int) : Boolean
      {
         return this.manuallyRightCut[param1];
      }
      
      public function setHideWall(param1:int, param2:Boolean) : void
      {
         this.hideWalls[param1] = param2;
      }
      
      public function setLength(param1:int, param2:int) : void
      {
         if(param2 < this.var_630[param1])
         {
            this.var_630[param1] = param2;
            this.manuallyRightCut[param1] = true;
         }
      }
      
      public function moveCorner(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         if(param2 > 0 && param2 < this.var_630[param1])
         {
            _loc3_ = var_429[this.getDirection(param1)];
            this.var_1176[param1] = this.var_1176[param1].add(new Point(param2 * _loc3_.x,param2 * _loc3_.y));
            this.var_630[param1] -= param2;
            this.manuallyLeftCut[param1] = true;
         }
      }
   }
}
