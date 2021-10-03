package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_906:int = 1;
      
      public static const const_955:int = 2;
      
      public static const const_857:int = 3;
      
      public static const const_1190:int = 4;
      
      public static const const_991:int = 5;
      
      public static const const_1417:int = 6;
       
      
      private var _type:int;
      
      private var var_1320:int;
      
      private var var_2395:String;
      
      private var var_2469:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1320 = param2;
         this.var_2395 = param3;
         this.var_2469 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2395;
      }
      
      public function get time() : String
      {
         return this.var_2469;
      }
      
      public function get senderId() : int
      {
         return this.var_1320;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
