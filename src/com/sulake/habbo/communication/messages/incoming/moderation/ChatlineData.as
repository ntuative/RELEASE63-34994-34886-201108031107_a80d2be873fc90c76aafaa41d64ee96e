package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2985:int;
      
      private var var_2986:int;
      
      private var var_2987:int;
      
      private var var_2988:String;
      
      private var var_2035:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2985 = param1.readInteger();
         this.var_2986 = param1.readInteger();
         this.var_2987 = param1.readInteger();
         this.var_2988 = param1.readString();
         this.var_2035 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2985;
      }
      
      public function get minute() : int
      {
         return this.var_2986;
      }
      
      public function get chatterId() : int
      {
         return this.var_2987;
      }
      
      public function get chatterName() : String
      {
         return this.var_2988;
      }
      
      public function get msg() : String
      {
         return this.var_2035;
      }
   }
}
