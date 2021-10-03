package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1213:int = 1;
      
      public static const const_811:int = 2;
      
      public static const const_736:int = 3;
      
      public static const const_2010:int = 4;
       
      
      private var _index:int;
      
      private var var_2686:String;
      
      private var var_2685:String;
      
      private var var_2682:Boolean;
      
      private var var_2683:String;
      
      private var var_1114:String;
      
      private var var_2684:int;
      
      private var var_2435:int;
      
      private var _type:int;
      
      private var var_2518:String;
      
      private var var_1026:GuestRoomData;
      
      private var var_1027:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2686 = param1.readString();
         this.var_2685 = param1.readString();
         this.var_2682 = param1.readInteger() == 1;
         this.var_2683 = param1.readString();
         this.var_1114 = param1.readString();
         this.var_2684 = param1.readInteger();
         this.var_2435 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1213)
         {
            this.var_2518 = param1.readString();
         }
         else if(this._type == const_736)
         {
            this.var_1027 = new PublicRoomData(param1);
         }
         else if(this._type == const_811)
         {
            this.var_1026 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1026 != null)
         {
            this.var_1026.dispose();
            this.var_1026 = null;
         }
         if(this.var_1027 != null)
         {
            this.var_1027.dispose();
            this.var_1027 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2686;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2685;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2682;
      }
      
      public function get picText() : String
      {
         return this.var_2683;
      }
      
      public function get picRef() : String
      {
         return this.var_1114;
      }
      
      public function get folderId() : int
      {
         return this.var_2684;
      }
      
      public function get tag() : String
      {
         return this.var_2518;
      }
      
      public function get userCount() : int
      {
         return this.var_2435;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1026;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1027;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1213)
         {
            return 0;
         }
         if(this.type == const_811)
         {
            return this.var_1026.maxUserCount;
         }
         if(this.type == const_736)
         {
            return this.var_1027.maxUsers;
         }
         return 0;
      }
   }
}
