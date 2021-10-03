package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1812:int;
      
      private var var_1879:int;
      
      private var var_1878:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1879 = param1.readInteger();
         this.var_1812 = param1.readInteger();
         this.var_1878 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1812 = 0;
         this.var_1879 = 0;
         this.var_1878 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1812;
      }
      
      public function get messageId() : int
      {
         return this.var_1879;
      }
      
      public function get timestamp() : String
      {
         return this.var_1878;
      }
   }
}
