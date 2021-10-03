package com.sulake.habbo.catalog.purse
{
   import flash.events.Event;
   
   public class PurseEvent extends Event
   {
      
      public static const const_130:String = "catalog_purse_credit_balance";
      
      public static const const_331:String = "catalog_purse_pixel_balance";
      
      public static const const_383:String = "catalog_purse_shell_balance";
       
      
      private var var_2220:int;
      
      public function PurseEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_2220 = param2;
      }
      
      public function get balance() : int
      {
         return this.var_2220;
      }
   }
}
