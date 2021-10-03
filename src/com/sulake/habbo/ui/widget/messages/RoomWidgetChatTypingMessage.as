package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_992:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_631:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_992);
         this.var_631 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_631;
      }
   }
}
