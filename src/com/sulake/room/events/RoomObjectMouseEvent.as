package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_170:String = "ROE_MOUSE_CLICK";
      
      public static const const_180:String = "ROE_MOUSE_ENTER";
      
      public static const const_588:String = "ROE_MOUSE_MOVE";
      
      public static const const_189:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2361:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_491:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2092:String = "";
      
      private var var_2399:Boolean;
      
      private var var_2396:Boolean;
      
      private var var_2398:Boolean;
      
      private var var_2397:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_2092 = param2;
         this.var_2399 = param5;
         this.var_2396 = param6;
         this.var_2398 = param7;
         this.var_2397 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_2092;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2399;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2396;
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
