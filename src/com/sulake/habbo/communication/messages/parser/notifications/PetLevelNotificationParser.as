package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1926:int;
      
      private var var_2373:String;
      
      private var var_1360:int;
      
      private var var_1214:int;
      
      private var var_1794:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1926 = param1.readInteger();
         this.var_2373 = param1.readString();
         this.var_1360 = param1.readInteger();
         this.var_1214 = param1.readInteger();
         this.var_1794 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1926;
      }
      
      public function get petName() : String
      {
         return this.var_2373;
      }
      
      public function get level() : int
      {
         return this.var_1360;
      }
      
      public function get petType() : int
      {
         return this.var_1214;
      }
      
      public function get breed() : int
      {
         return this.var_1794;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
