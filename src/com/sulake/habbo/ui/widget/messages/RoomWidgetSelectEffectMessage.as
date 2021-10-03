package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_1393:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_1341:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_1218:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_911:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_911 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_911;
      }
   }
}
