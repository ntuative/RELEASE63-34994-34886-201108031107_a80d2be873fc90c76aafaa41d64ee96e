package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2310:int;
      
      private var var_2308:int;
      
      private var var_2312:int;
      
      private var _dayOffsets:Array;
      
      private var var_1743:Array;
      
      private var var_1742:Array;
      
      private var var_2311:int;
      
      private var var_2309:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2310;
      }
      
      public function get offerCount() : int
      {
         return this.var_2308;
      }
      
      public function get historyLength() : int
      {
         return this.var_2312;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1743;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1742;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2311;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2309;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2310 = param1.readInteger();
         this.var_2308 = param1.readInteger();
         this.var_2312 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1743 = [];
         this.var_1742 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1743.push(param1.readInteger());
            this.var_1742.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2309 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         return true;
      }
   }
}
