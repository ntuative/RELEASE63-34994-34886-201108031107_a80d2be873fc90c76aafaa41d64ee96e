package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1788:String;
      
      private var var_2335:int;
      
      private var _password:String;
      
      private var var_1652:int;
      
      private var var_2856:int;
      
      private var var_954:Array;
      
      private var var_2851:Array;
      
      private var var_2848:Boolean;
      
      private var var_2852:Boolean;
      
      private var var_2855:Boolean;
      
      private var var_2849:Boolean;
      
      private var var_2850:int;
      
      private var var_2847:int;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2848;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2848 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2852;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2852 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2855;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2855 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2849;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2849 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2850;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2850 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2847;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2847 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1788;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1788 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2335;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2335 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1652;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1652 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2856;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2856 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_954;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_954 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2851;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2851 = param1;
      }
   }
}
