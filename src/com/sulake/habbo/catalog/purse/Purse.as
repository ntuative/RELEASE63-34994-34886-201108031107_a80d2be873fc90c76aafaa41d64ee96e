package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1984:int = 0;
      
      private var var_1629:Dictionary;
      
      private var var_2086:int = 0;
      
      private var var_2087:int = 0;
      
      private var var_2513:Boolean = false;
      
      private var var_2752:int = 0;
      
      private var var_2759:int = 0;
      
      private var var_2512:Boolean = false;
      
      public function Purse()
      {
         this.var_1629 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1984;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1984 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2086;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2086 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2087;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2087 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_2086 > 0 || this.var_2087 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2513;
      }
      
      public function get isExpiring() : Boolean
      {
         return this.var_2512;
      }
      
      public function set isExpiring(param1:Boolean) : void
      {
         this.var_2512 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2513 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2752;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2752 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2759;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2759 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1629;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1629 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1629[param1];
      }
   }
}
