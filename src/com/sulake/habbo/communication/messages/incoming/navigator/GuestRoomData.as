package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_415:int;
      
      private var var_875:Boolean;
      
      private var var_1041:String;
      
      private var _ownerName:String;
      
      private var var_2335:int;
      
      private var var_2435:int;
      
      private var var_2949:int;
      
      private var var_1788:String;
      
      private var var_2951:int;
      
      private var var_2334:Boolean;
      
      private var var_855:int;
      
      private var var_1652:int;
      
      private var var_2950:String;
      
      private var var_954:Array;
      
      private var var_2948:RoomThumbnailData;
      
      private var var_2848:Boolean;
      
      private var var_2947:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_954 = new Array();
         super();
         this.var_415 = param1.readInteger();
         this.var_875 = param1.readBoolean();
         this.var_1041 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2335 = param1.readInteger();
         this.var_2435 = param1.readInteger();
         this.var_2949 = param1.readInteger();
         this.var_1788 = param1.readString();
         this.var_2951 = param1.readInteger();
         this.var_2334 = param1.readBoolean();
         this.var_855 = param1.readInteger();
         this.var_1652 = param1.readInteger();
         this.var_2950 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_954.push(_loc4_);
            _loc3_++;
         }
         this.var_2948 = new RoomThumbnailData(param1);
         this.var_2848 = param1.readBoolean();
         this.var_2947 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_415;
      }
      
      public function get event() : Boolean
      {
         return this.var_875;
      }
      
      public function get roomName() : String
      {
         return this.var_1041;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2335;
      }
      
      public function get userCount() : int
      {
         return this.var_2435;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2949;
      }
      
      public function get description() : String
      {
         return this.var_1788;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2951;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2334;
      }
      
      public function get score() : int
      {
         return this.var_855;
      }
      
      public function get categoryId() : int
      {
         return this.var_1652;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2950;
      }
      
      public function get tags() : Array
      {
         return this.var_954;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2948;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2848;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2947;
      }
   }
}
