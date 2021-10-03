package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1361:int;
      
      private var var_2014:String;
      
      private var var_1299:int;
      
      private var var_1298:int;
      
      private var var_2015:int;
      
      private var _clubLevel:int;
      
      private var var_1413:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1361 = param1.readInteger();
         this.var_2014 = param1.readString();
         this.var_1299 = param1.readInteger();
         this.var_1298 = param1.readInteger();
         this.var_2015 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1413 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1413.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this._clubLevel = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1361;
      }
      
      public function get localizationId() : String
      {
         return this.var_2014;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1299;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1298;
      }
      
      public function get products() : Array
      {
         return this.var_1413;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2015;
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
   }
}
