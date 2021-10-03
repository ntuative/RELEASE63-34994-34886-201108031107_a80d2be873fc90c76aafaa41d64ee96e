package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_78:String = "s";
      
      public static const const_198:String = "e";
       
      
      private var var_1562:String;
      
      private var var_2586:int;
      
      private var var_1016:String;
      
      private var var_1563:int;
      
      private var var_1972:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1562 = param1.readString();
         this.var_2586 = param1.readInteger();
         this.var_1016 = param1.readString();
         this.var_1563 = param1.readInteger();
         this.var_1972 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1562;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2586;
      }
      
      public function get extraParam() : String
      {
         return this.var_1016;
      }
      
      public function get productCount() : int
      {
         return this.var_1563;
      }
      
      public function get expiration() : int
      {
         return this.var_1972;
      }
   }
}
