package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1711:Boolean;
      
      private var var_2476:int;
      
      private var var_1861:int;
      
      private var var_1860:int;
      
      private var var_2480:int;
      
      private var var_2475:int;
      
      private var var_2479:int;
      
      private var var_2477:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1711;
      }
      
      public function get commission() : int
      {
         return this.var_2476;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1861;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1860;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2475;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2480;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2479;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2477;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1711 = param1.readBoolean();
         this.var_2476 = param1.readInteger();
         this.var_1861 = param1.readInteger();
         this.var_1860 = param1.readInteger();
         this.var_2475 = param1.readInteger();
         this.var_2480 = param1.readInteger();
         this.var_2479 = param1.readInteger();
         this.var_2477 = param1.readInteger();
         return true;
      }
   }
}
