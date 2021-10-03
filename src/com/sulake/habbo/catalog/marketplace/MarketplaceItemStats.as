package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2310:int;
      
      private var var_2308:int;
      
      private var var_2312:int;
      
      private var _dayOffsets:Array;
      
      private var var_1743:Array;
      
      private var var_1742:Array;
      
      private var var_2311:int;
      
      private var var_2309:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2310 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2312 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1743 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1742 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2311 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2309 = param1;
      }
   }
}
