package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1361:int;
      
      private var var_1734:String;
      
      private var var_1735:int;
      
      private var _upgrade:Boolean;
      
      private var var_2300:Boolean;
      
      private var var_2297:int;
      
      private var var_2302:int;
      
      private var var_2301:int;
      
      private var var_2303:int;
      
      private var var_2299:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1361 = param1.readInteger();
         this.var_1734 = param1.readString();
         this.var_1735 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2300 = param1.readBoolean();
         this.var_2297 = param1.readInteger();
         this.var_2302 = param1.readInteger();
         this.var_2301 = param1.readInteger();
         this.var_2303 = param1.readInteger();
         this.var_2299 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1361;
      }
      
      public function get productCode() : String
      {
         return this.var_1734;
      }
      
      public function get price() : int
      {
         return this.var_1735;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2300;
      }
      
      public function get periods() : int
      {
         return this.var_2297;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2302;
      }
      
      public function get year() : int
      {
         return this.var_2301;
      }
      
      public function get month() : int
      {
         return this.var_2303;
      }
      
      public function get day() : int
      {
         return this.var_2299;
      }
   }
}
