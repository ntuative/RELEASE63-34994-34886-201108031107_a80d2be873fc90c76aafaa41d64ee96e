package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1792:int;
      
      private var var_2389:int;
      
      private var var_1573:int;
      
      private var var_2390:int;
      
      private var var_141:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1792 = param1.readInteger();
         this.var_2389 = param1.readInteger();
         this.var_1573 = param1.readInteger();
         this.var_2390 = param1.readInteger();
         this.var_141 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1792);
      }
      
      public function get callId() : int
      {
         return this.var_1792;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2389;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1573;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2390;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_141;
      }
   }
}
