package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetChangeEmailResultEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_844:String = "rwcere_change_email_result";
       
      
      private var _result:int;
      
      public function RoomWidgetChangeEmailResultEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_844,param2,param3);
         this._result = param1;
      }
      
      public function get result() : int
      {
         return this._result;
      }
   }
}
