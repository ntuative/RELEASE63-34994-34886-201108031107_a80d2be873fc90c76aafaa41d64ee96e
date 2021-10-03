package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_415:int;
      
      private var var_2435:int;
      
      private var var_2434:Boolean;
      
      private var var_2433:int;
      
      private var _ownerName:String;
      
      private var var_141:RoomData;
      
      private var var_875:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_415 = param1.readInteger();
         this.var_2435 = param1.readInteger();
         this.var_2434 = param1.readBoolean();
         this.var_2433 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_141 = new RoomData(param1);
         this.var_875 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_141 != null)
         {
            this.var_141.dispose();
            this.var_141 = null;
         }
         if(this.var_875 != null)
         {
            this.var_875.dispose();
            this.var_875 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_415;
      }
      
      public function get userCount() : int
      {
         return this.var_2435;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2434;
      }
      
      public function get ownerId() : int
      {
         return this.var_2433;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_141;
      }
      
      public function get event() : RoomData
      {
         return this.var_875;
      }
   }
}
