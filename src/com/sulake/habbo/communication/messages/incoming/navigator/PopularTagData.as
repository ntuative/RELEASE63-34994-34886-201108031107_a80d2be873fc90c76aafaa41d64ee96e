package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_3023:String;
      
      private var var_2435:int;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         this.var_3023 = param1.readString();
         this.var_2435 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return this.var_3023;
      }
      
      public function get userCount() : int
      {
         return this.var_2435;
      }
   }
}
