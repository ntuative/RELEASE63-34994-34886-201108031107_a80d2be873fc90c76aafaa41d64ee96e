package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2707:Boolean;
      
      private var var_2706:int;
      
      private var var_1996:Array;
      
      private var var_886:Array;
      
      private var var_887:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2707;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2706;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1996;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_886;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_887;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1996 = [];
         this.var_886 = [];
         this.var_887 = [];
         this.var_2707 = param1.readBoolean();
         this.var_2706 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1996.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_886.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_887.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
