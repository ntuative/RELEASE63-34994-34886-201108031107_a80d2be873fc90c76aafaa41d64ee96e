package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_297:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2825:int = 0;
      
      private var var_2824:int = 0;
      
      private var var_2827:int = 0;
      
      private var var_2826:Boolean = false;
      
      private var _clubLevel:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_297,param6,param7);
         this.var_2825 = param1;
         this.var_2824 = param2;
         this.var_2827 = param3;
         this.var_2826 = param4;
         this._clubLevel = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2825;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2824;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2827;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2826;
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
   }
}
