package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_2045:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1463:String;
      
      private var var_1803:int;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         this.var_1463 = param2;
         this.var_1803 = param3;
      }
      
      public function get itemType() : String
      {
         return this.var_1463;
      }
      
      public function get classId() : int
      {
         return this.var_1803;
      }
   }
}
