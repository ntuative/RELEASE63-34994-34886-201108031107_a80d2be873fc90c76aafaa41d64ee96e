package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const ASSET_LOADER_EVENT_COMPLETE:String = "AssetLoaderEventComplete";
      
      public static const const_1379:String = "AssetLoaderEventProgress";
      
      public static const const_1193:String = "AssetLoaderEventUnload";
      
      public static const const_1404:String = "AssetLoaderEventStatus";
      
      public static const const_40:String = "AssetLoaderEventError";
      
      public static const const_1383:String = "AssetLoaderEventOpen";
       
      
      private var var_433:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_433 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_433;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_433);
      }
      
      override public function toString() : String
      {
         return formatToString("AssetLoaderEvent","type","status");
      }
   }
}
