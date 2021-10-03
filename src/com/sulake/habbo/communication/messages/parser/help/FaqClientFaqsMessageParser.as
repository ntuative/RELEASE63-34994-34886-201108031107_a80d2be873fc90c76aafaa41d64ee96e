package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class FaqClientFaqsMessageParser implements IMessageParser
   {
       
      
      private var var_1088:Map;
      
      private var var_1087:Map;
      
      public function FaqClientFaqsMessageParser()
      {
         super();
      }
      
      public function get urgentData() : Map
      {
         return this.var_1088;
      }
      
      public function get normalData() : Map
      {
         return this.var_1087;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1088 != null)
         {
            this.var_1088.dispose();
         }
         this.var_1088 = null;
         if(this.var_1087 != null)
         {
            this.var_1087.dispose();
         }
         this.var_1087 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_1088 = new Map();
         this.var_1087 = new Map();
         _loc5_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            this.var_1088.add(_loc2_,_loc3_);
            _loc4_++;
         }
         _loc5_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            this.var_1087.add(_loc2_,_loc3_);
            _loc4_++;
         }
         return true;
      }
   }
}
