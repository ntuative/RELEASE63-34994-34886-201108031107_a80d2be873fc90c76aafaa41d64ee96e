package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1773:String = "pricing_model_unknown";
      
      public static const const_396:String = "pricing_model_single";
      
      public static const const_411:String = "pricing_model_multi";
      
      public static const const_630:String = "pricing_model_bundle";
      
      public static const const_1975:String = "price_type_none";
      
      public static const const_956:String = "price_type_credits";
      
      public static const const_1322:String = "price_type_activitypoints";
      
      public static const const_1180:String = "price_type_credits_and_activitypoints";
       
      
      private var var_840:String;
      
      private var var_1297:String;
      
      private var var_1361:int;
      
      private var var_2014:String;
      
      private var var_1299:int;
      
      private var var_1298:int;
      
      private var var_2015:int;
      
      private var var_240:ICatalogPage;
      
      private var var_685:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var _clubLevel:int = 0;
      
      private var var_2735:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1361 = param1;
         this.var_2014 = param2;
         this.var_1299 = param3;
         this.var_1298 = param4;
         this.var_2015 = param5;
         this.var_240 = param8;
         this._clubLevel = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_240;
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
      
      public function get activityPointType() : int
      {
         return this.var_2015;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_685;
      }
      
      public function get pricingModel() : String
      {
         return this.var_840;
      }
      
      public function get priceType() : String
      {
         return this.var_1297;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2735;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2735 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1361 = 0;
         this.var_2014 = "";
         this.var_1299 = 0;
         this.var_1298 = 0;
         this.var_2015 = 0;
         this.var_240 = null;
         if(this.var_685 != null)
         {
            this.var_685.dispose();
            this.var_685 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_840)
         {
            case const_396:
               this.var_685 = new SingleProductContainer(this,param1);
               break;
            case const_411:
               this.var_685 = new MultiProductContainer(this,param1);
               break;
            case const_630:
               this.var_685 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_840);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_840 = const_396;
            }
            else
            {
               this.var_840 = const_411;
            }
         }
         else if(param1.length > 1)
         {
            this.var_840 = const_630;
         }
         else
         {
            this.var_840 = const_1773;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1299 > 0 && this.var_1298 > 0)
         {
            this.var_1297 = const_1180;
         }
         else if(this.var_1299 > 0)
         {
            this.var_1297 = const_956;
         }
         else if(this.var_1298 > 0)
         {
            this.var_1297 = const_1322;
         }
         else
         {
            this.var_1297 = const_1975;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_240.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_685.products)
         {
            _loc4_ = this.var_240.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
