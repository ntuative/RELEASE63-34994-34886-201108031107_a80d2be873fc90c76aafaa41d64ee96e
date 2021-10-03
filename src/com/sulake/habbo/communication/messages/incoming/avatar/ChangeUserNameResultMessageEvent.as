package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_509:int = 0;
      
      public static var var_942:int = 1;
      
      public static var var_939:int = 2;
      
      public static var var_941:int = 3;
      
      public static var var_940:int = 4;
      
      public static var var_943:int = 5;
      
      public static var var_1153:int = 6;
      
      public static var var_1154:int = 7;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_9 as ChangeUserNameResultMessageParser;
      }
   }
}
