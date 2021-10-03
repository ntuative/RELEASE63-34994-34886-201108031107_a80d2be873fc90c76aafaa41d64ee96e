package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _type:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var var_1866:Number;
      
      protected var var_2283:String;
      
      protected var var_3068:Boolean;
      
      protected var var_3069:Boolean;
      
      protected var var_2499:Boolean;
      
      protected var var_2410:Boolean;
      
      protected var var_1110:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number)
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
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get extra() : Number
      {
         return this.var_1866;
      }
      
      public function get stuffData() : String
      {
         return this.var_2283;
      }
      
      public function set stuffData(param1:String) : void
      {
         this.var_2283 = param1;
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
      
      public function get locked() : Boolean
      {
         return this.var_1110;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_1110 = param1;
      }
   }
}
