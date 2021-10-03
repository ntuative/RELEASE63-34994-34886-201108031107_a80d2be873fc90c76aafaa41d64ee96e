package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2283:String;
      
      protected var var_1866:Number;
      
      protected var var_3068:Boolean;
      
      protected var var_3069:Boolean;
      
      protected var var_2499:Boolean;
      
      protected var var_2410:Boolean;
      
      protected var var_3070:int;
      
      protected var var_2497:int;
      
      protected var var_2492:int;
      
      protected var var_2494:int;
      
      protected var var_2216:String;
      
      protected var var_1698:int;
      
      protected var var_1110:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2499 = param5;
         this.var_3069 = param6;
         this.var_3068 = param7;
         this.var_2410 = param8;
         this.var_2283 = param9;
         this.var_1866 = param10;
         this.var_3070 = param11;
         this.var_2497 = param12;
         this.var_2492 = param13;
         this.var_2494 = param14;
         this.var_2216 = param15;
         this.var_1698 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2283;
      }
      
      public function get extra() : Number
      {
         return this.var_1866;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_3068;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_3069;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2499;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2410;
      }
      
      public function get expires() : int
      {
         return this.var_3070;
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
      
      public function get slotId() : String
      {
         return this.var_2216;
      }
      
      public function get songId() : int
      {
         return this.var_1698;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_1110 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_1110;
      }
   }
}
