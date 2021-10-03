package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1926:int;
      
      private var _name:String;
      
      private var var_1360:int;
      
      private var var_2663:int;
      
      private var var_2331:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_754:String;
      
      private var var_2661:int;
      
      private var var_2662:int;
      
      private var var_2664:int;
      
      private var var_2657:int;
      
      private var var_2433:int;
      
      private var _ownerName:String;
      
      private var var_524:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1926;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1360;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2663;
      }
      
      public function get experience() : int
      {
         return this.var_2331;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2661;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2662;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2664;
      }
      
      public function get respect() : int
      {
         return this.var_2657;
      }
      
      public function get ownerId() : int
      {
         return this.var_2433;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_524;
      }
      
      public function flush() : Boolean
      {
         this.var_1926 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1926 = param1.readInteger();
         this._name = param1.readString();
         this.var_1360 = param1.readInteger();
         this.var_2663 = param1.readInteger();
         this.var_2331 = param1.readInteger();
         this.var_2661 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2662 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2664 = param1.readInteger();
         this.var_754 = param1.readString();
         this.var_2657 = param1.readInteger();
         this.var_2433 = param1.readInteger();
         this.var_524 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
