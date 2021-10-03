package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2086:int = 0;
      
      private var var_2087:int = 0;
      
      private var var_2511:int = 0;
      
      private var var_2510:Boolean = false;
      
      private var var_2513:Boolean = false;
      
      private var var_2512:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2086 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2087 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2511 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2510 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2513 = param1;
      }
      
      public function set clubIsExpiring(param1:Boolean) : void
      {
         this.var_2512 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2086;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2087;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2511;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2510;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2513;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return this.var_2512;
      }
   }
}
