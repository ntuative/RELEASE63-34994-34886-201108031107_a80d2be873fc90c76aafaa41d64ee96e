package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1243:Boolean;
      
      private var var_1244:Boolean;
      
      private var var_1535:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1243;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1244;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1535;
      }
      
      public function flush() : Boolean
      {
         this.var_1243 = false;
         this.var_1244 = false;
         this.var_1535 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1243 = param1.readBoolean();
         this.var_1244 = param1.readBoolean();
         this.var_1535 = param1.readBoolean();
         return true;
      }
   }
}
