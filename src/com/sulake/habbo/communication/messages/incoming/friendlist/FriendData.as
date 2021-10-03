package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _gender:int;
      
      private var var_889:Boolean;
      
      private var var_1821:Boolean;
      
      private var var_754:String;
      
      private var var_1652:int;
      
      private var var_1820:String;
      
      private var var_1818:String;
      
      private var var_1819:String;
      
      private var var_2590:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_889 = param1.readBoolean();
         this.var_1821 = param1.readBoolean();
         this.var_754 = param1.readString();
         this.var_1652 = param1.readInteger();
         this.var_1820 = param1.readString();
         this.var_1818 = param1.readString();
         this.var_1819 = param1.readString();
         this.var_2590 = param1.readString();
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
      
      public function get facebookId() : String
      {
         return this.var_2590;
      }
   }
}
