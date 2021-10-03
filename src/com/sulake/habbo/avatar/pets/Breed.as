package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var _id:int;
      
      private var var_351:String = "";
      
      private var _gender:String;
      
      private var var_1497:Boolean;
      
      private var var_2601:Boolean = true;
      
      private var var_2599:int;
      
      private var var_2600:String;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2599 = parseInt(param1.@pattern);
         this._gender = String(param1.@gender);
         this.var_1497 = Boolean(parseInt(param1.@colorable));
         this.var_351 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2601 = false;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this._gender;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1497;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2601;
      }
      
      public function get patternId() : int
      {
         return this.var_2599;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2600;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2600 = param1;
      }
      
      public function get localizationKey() : String
      {
         return this.var_351;
      }
   }
}
