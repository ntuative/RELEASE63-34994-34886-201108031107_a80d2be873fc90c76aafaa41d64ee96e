package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2072:int = 0;
      
      private var var_2073:int = 0;
      
      private var var_2015:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2072;
      }
      
      public function get method_16() : int
      {
         return this.var_2073;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2015;
      }
      
      public function flush() : Boolean
      {
         this.var_2072 = 0;
         this.var_2073 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2072 = param1.readInteger();
         this.var_2073 = param1.readInteger();
         this.var_2015 = param1.readInteger();
         return true;
      }
   }
}
