package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2493:int;
      
      private var var_1463:String;
      
      private var var_2496:int;
      
      private var var_2498:int;
      
      private var _category:int;
      
      private var var_2283:String;
      
      private var var_1866:int;
      
      private var var_2495:int;
      
      private var var_2497:int;
      
      private var var_2492:int;
      
      private var var_2494:int;
      
      private var var_2499:Boolean;
      
      private var var_3132:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2493 = param1;
         this.var_1463 = param2;
         this.var_2496 = param3;
         this.var_2498 = param4;
         this._category = param5;
         this.var_2283 = param6;
         this.var_1866 = param7;
         this.var_2495 = param8;
         this.var_2497 = param9;
         this.var_2492 = param10;
         this.var_2494 = param11;
         this.var_2499 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2493;
      }
      
      public function get itemType() : String
      {
         return this.var_1463;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2496;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2498;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2283;
      }
      
      public function get extra() : int
      {
         return this.var_1866;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2495;
      }
      
      public function get creationDay() : int
      {
         return this.var_2497;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2492;
      }
      
      public function get creationYear() : int
      {
         return this.var_2494;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2499;
      }
      
      public function get songID() : int
      {
         return this.var_1866;
      }
   }
}
