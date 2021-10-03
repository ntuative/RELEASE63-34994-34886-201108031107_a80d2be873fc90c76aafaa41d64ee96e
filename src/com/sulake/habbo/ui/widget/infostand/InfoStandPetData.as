package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1360:int;
      
      private var var_2656:int;
      
      private var var_2331:int;
      
      private var var_2658:int;
      
      private var _energy:int;
      
      private var var_2655:int;
      
      private var _nutrition:int;
      
      private var var_2659:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1926:int = -1;
      
      private var _type:int;
      
      private var var_2383:int;
      
      private var var_48:BitmapData;
      
      private var var_2835:Boolean;
      
      private var var_2433:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2654:int;
      
      private var var_524:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1926;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2383;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2835;
      }
      
      public function get ownerId() : int
      {
         return this.var_2433;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_524;
      }
      
      public function get level() : int
      {
         return this.var_1360;
      }
      
      public function get levelMax() : int
      {
         return this.var_2656;
      }
      
      public function get experience() : int
      {
         return this.var_2331;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2658;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2655;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2659;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2654;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1926 = param1.id;
         this._type = param1.petType;
         this.var_2383 = param1.petRace;
         this.var_48 = param1.image;
         this.var_2835 = param1.isOwnPet;
         this.var_2433 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1360 = param1.level;
         this.var_2656 = param1.levelMax;
         this.var_2331 = param1.experience;
         this.var_2658 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2655 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2659 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2654 = param1.roomIndex;
         this.var_524 = param1.age;
      }
   }
}
