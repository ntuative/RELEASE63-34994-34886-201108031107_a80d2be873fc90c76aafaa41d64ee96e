package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1960:Boolean;
      
      private var var_2642:int;
      
      private var var_2643:String;
      
      private var var_415:int;
      
      private var var_2644:int;
      
      private var var_2205:String;
      
      private var var_2641:String;
      
      private var var_2640:String;
      
      private var var_954:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_954 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1960 = false;
            return;
         }
         this.var_1960 = true;
         this.var_2642 = int(_loc2_);
         this.var_2643 = param1.readString();
         this.var_415 = int(param1.readString());
         this.var_2644 = param1.readInteger();
         this.var_2205 = param1.readString();
         this.var_2641 = param1.readString();
         this.var_2640 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_954.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_954 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2642;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2643;
      }
      
      public function get flatId() : int
      {
         return this.var_415;
      }
      
      public function get eventType() : int
      {
         return this.var_2644;
      }
      
      public function get eventName() : String
      {
         return this.var_2205;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2641;
      }
      
      public function get creationTime() : String
      {
         return this.var_2640;
      }
      
      public function get tags() : Array
      {
         return this.var_954;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1960;
      }
   }
}
