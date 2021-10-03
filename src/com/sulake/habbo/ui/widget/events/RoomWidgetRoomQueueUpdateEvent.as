package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_431:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_550:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1342:int;
      
      private var var_2607:Boolean;
      
      private var var_550:Boolean;
      
      private var var_1927:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1342 = param2;
         this.var_2607 = param3;
         this.var_550 = param4;
         this.var_1927 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1342;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2607;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_550;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1927;
      }
   }
}
