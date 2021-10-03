package com.sulake.habbo.room.object
{
   public class RoomStairData
   {
       
      
      private var var_2741:int;
      
      private var var_2021:Boolean;
      
      private var var_2020:Boolean;
      
      private var var_49:Boolean;
      
      public function RoomStairData(param1:int, param2:Boolean, param3:Boolean, param4:Boolean)
      {
         super();
         this.var_49 = param4;
         this.var_2741 = param1;
         this.var_2021 = param2;
         this.var_2020 = param3;
      }
      
      public function get stairHeight() : int
      {
         return this.var_2741;
      }
      
      public function get neighbourStairMin() : Boolean
      {
         return this.var_2021;
      }
      
      public function get neighbourStairMax() : Boolean
      {
         return this.var_2020;
      }
      
      public function get neighbourStair() : Boolean
      {
         return this.var_2021 || this.var_2020;
      }
      
      public function get border() : Boolean
      {
         return this.var_49;
      }
   }
}
