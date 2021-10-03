package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
      
      private static var var_1263:int = 0;
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _gender:int;
      
      private var var_889:Boolean;
      
      private var _allowFollow:Boolean;
      
      private var var_754:String;
      
      private var var_1652:int;
      
      private var var_1820:String;
      
      private var var_1818:String;
      
      private var var_1819:String;
      
      private var var_1100:Vector.<FriendNotification>;
      
      private var var_2645:int = -1;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1819 = param3;
         this.var_1820 = param4;
         this._gender = param5;
         this.var_889 = param6;
         this._allowFollow = param7;
         this.var_754 = param8;
         this.var_1652 = param9;
         this.var_1818 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this._allowFollow;
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function get categoryId() : int
      {
         return this.var_1652;
      }
      
      public function get motto() : String
      {
         return this.var_1820;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1818;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
      
      public function get logEventId() : int
      {
         return this.var_2645;
      }
      
      public function get notifications() : Vector.<FriendNotification>
      {
         if(!this.var_1100)
         {
            this.var_1100 = new Vector.<FriendNotification>();
         }
         return this.var_1100;
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
      
      public function set allowFollow(param1:Boolean) : void
      {
         this._allowFollow = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_754 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1652 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1820 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1818 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1819 = param1;
      }
      
      public function set logEventId(param1:int) : void
      {
         this.var_2645 = param1;
      }
      
      public function getNextLogEventId() : int
      {
         return ++var_1263;
      }
   }
}
