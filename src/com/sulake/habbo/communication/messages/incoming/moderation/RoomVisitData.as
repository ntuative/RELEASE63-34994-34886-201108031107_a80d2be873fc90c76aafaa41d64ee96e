package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2144:Boolean;
      
      private var _roomId:int;
      
      private var var_1041:String;
      
      private var var_2652:int;
      
      private var var_2653:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2144 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_1041 = param1.readString();
         this.var_2652 = param1.readInteger();
         this.var_2653 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2144;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_1041;
      }
      
      public function get enterHour() : int
      {
         return this.var_2652;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2653;
      }
   }
}
