package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_2316:int = "F".charCodeAt(0);
      
      public static const const_2193:int = "M".charCodeAt(0);
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _gender:int;
      
      private var var_889:Boolean;
      
      private var var_1821:Boolean;
      
      private var var_754:String;
      
      private var var_1820:String;
      
      private var var_1818:String;
      
      private var var_1652:int;
      
      private var _selected:Boolean;
      
      private var _disposed:Boolean;
      
      private var _view:IWindowContainer;
      
      private var var_1206:BitmapData;
      
      private var var_1819:String;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._id = param1.id;
         this._name = param1.name;
         this._gender = param1.gender;
         this.var_889 = param1.online;
         this.var_1821 = param1.followingAllowed && param1.online;
         this.var_754 = param1.figure;
         this.var_1820 = param1.motto;
         this.var_1818 = param1.lastAccess;
         this.var_1652 = param1.categoryId;
         this.var_1819 = param1.realName;
         Logger.log("Creating friend: " + this.id + ", " + this.name + ", " + this.gender + ", " + this.online + ", " + this.followingAllowed + ", " + this.figure + ", " + this.categoryId);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_1206 != null)
         {
            this.var_1206.dispose();
            this.var_1206 = null;
         }
         this._disposed = true;
         this._view = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this._gender;
      }
      
      public function get online() : Boolean
      {
         return this.var_889;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1821;
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function get motto() : String
      {
         return this.var_1820;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1818;
      }
      
      public function get categoryId() : int
      {
         return this.var_1652;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function get face() : BitmapData
      {
         return this.var_1206;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this._gender = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_889 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1821 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_754 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1820 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1818 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1652 = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         this.var_1206 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1819 = param1;
      }
   }
}
