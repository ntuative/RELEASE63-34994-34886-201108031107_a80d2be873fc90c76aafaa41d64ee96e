package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2732:int;
      
      private var var_1463:String;
      
      private var _objId:int;
      
      private var var_1803:int;
      
      private var _category:int;
      
      private var var_2283:String;
      
      private var var_2731:Boolean;
      
      private var var_2733:Boolean;
      
      private var var_2734:Boolean;
      
      private var var_2601:Boolean;
      
      private var var_2730:int;
      
      private var var_1866:int;
      
      private var var_2216:String = "";
      
      private var var_1698:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2732 = param1;
         this.var_1463 = param2;
         this._objId = param3;
         this.var_1803 = param4;
         this._category = param5;
         this.var_2283 = param6;
         this.var_2731 = param7;
         this.var_2733 = param8;
         this.var_2734 = param9;
         this.var_2601 = param10;
         this.var_2730 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2216 = param1;
         this.var_1866 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2732;
      }
      
      public function get itemType() : String
      {
         return this.var_1463;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1803;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2283;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2731;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2733;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2734;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2601;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2730;
      }
      
      public function get slotId() : String
      {
         return this.var_2216;
      }
      
      public function get songId() : int
      {
         return this.var_1698;
      }
      
      public function get extra() : int
      {
         return this.var_1866;
      }
   }
}
