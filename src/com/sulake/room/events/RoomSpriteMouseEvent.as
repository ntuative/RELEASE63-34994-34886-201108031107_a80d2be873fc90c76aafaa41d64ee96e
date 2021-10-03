package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2092:String = "";
      
      private var var_2048:String = "";
      
      private var var_2401:String = "";
      
      private var var_2624:Number = 0;
      
      private var var_2621:Number = 0;
      
      private var var_2622:Number = 0;
      
      private var var_2623:Number = 0;
      
      private var var_2396:Boolean = false;
      
      private var var_2399:Boolean = false;
      
      private var var_2398:Boolean = false;
      
      private var var_2397:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2092 = param2;
         this.var_2048 = param3;
         this.var_2401 = param4;
         this.var_2624 = param5;
         this.var_2621 = param6;
         this.var_2622 = param7;
         this.var_2623 = param8;
         this.var_2396 = param9;
         this.var_2399 = param10;
         this.var_2398 = param11;
         this.var_2397 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2092;
      }
      
      public function get canvasId() : String
      {
         return this.var_2048;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2401;
      }
      
      public function get screenX() : Number
      {
         return this.var_2624;
      }
      
      public function get screenY() : Number
      {
         return this.var_2621;
      }
      
      public function get localX() : Number
      {
         return this.var_2622;
      }
      
      public function get localY() : Number
      {
         return this.var_2623;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2396;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2399;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2398;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2397;
      }
   }
}
