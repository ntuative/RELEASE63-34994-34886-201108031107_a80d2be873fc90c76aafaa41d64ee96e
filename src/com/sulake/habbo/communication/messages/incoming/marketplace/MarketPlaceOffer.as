package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1361:int;
      
      private var _furniId:int;
      
      private var var_2322:int;
      
      private var var_2283:String;
      
      private var var_1735:int;
      
      private var var_433:int;
      
      private var var_2323:int = -1;
      
      private var var_2310:int;
      
      private var var_1750:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1361 = param1;
         this._furniId = param2;
         this.var_2322 = param3;
         this.var_2283 = param4;
         this.var_1735 = param5;
         this.var_433 = param6;
         this.var_2323 = param7;
         this.var_2310 = param8;
         this.var_1750 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1361;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2322;
      }
      
      public function get stuffData() : String
      {
         return this.var_2283;
      }
      
      public function get price() : int
      {
         return this.var_1735;
      }
      
      public function get status() : int
      {
         return this.var_433;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2323;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2310;
      }
      
      public function get offerCount() : int
      {
         return this.var_1750;
      }
   }
}
