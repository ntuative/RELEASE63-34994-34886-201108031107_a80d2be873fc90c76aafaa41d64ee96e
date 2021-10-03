package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2406:Number = 0.0;
      
      private var var_2405:Number = 0.0;
      
      private var var_2700:Number = 0.0;
      
      private var var_2699:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2406 = param1;
         this.var_2405 = param2;
         this.var_2700 = param3;
         this.var_2699 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2406;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2405;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2700;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2699;
      }
   }
}
