package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1824:int;
      
      private var var_3028:String;
      
      private var var_340:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1824 = param1.readInteger();
         this.var_3028 = param1.readString();
         this.var_340 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1824;
      }
      
      public function get nodeName() : String
      {
         return this.var_3028;
      }
      
      public function get visible() : Boolean
      {
         return this.var_340;
      }
   }
}
