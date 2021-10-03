package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_754:String;
      
      private var var_1020:String;
      
      private var var_2516:String;
      
      private var var_1819:String;
      
      private var var_2514:int;
      
      private var var_2515:int;
      
      private var var_1309:int;
      
      private var var_848:int;
      
      private var var_2517:Boolean;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_754 = param1.readString();
         this.var_1020 = param1.readString();
         this.var_2516 = param1.readString();
         this.var_1819 = param1.readString();
         this.var_2514 = param1.readInteger();
         this.var_2515 = param1.readInteger();
         this.var_1309 = param1.readInteger();
         this.var_848 = param1.readInteger();
         this.var_2517 = param1.readBoolean();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function get sex() : String
      {
         return this.var_1020;
      }
      
      public function get customData() : String
      {
         return this.var_2516;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
      
      public function get directMail() : int
      {
         return this.var_2514;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2515;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1309;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_848;
      }
      
      public function get streamPublishingAllowed() : Boolean
      {
         return this.var_2517;
      }
   }
}
