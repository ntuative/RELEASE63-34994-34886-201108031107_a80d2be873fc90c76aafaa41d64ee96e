package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _type:int;
      
      private var var_1838:int;
      
      private var var_1145:int = 1;
      
      private var var_1707:int;
      
      private var var_550:Boolean = false;
      
      private var _isSelected:Boolean = false;
      
      private var var_2206:Boolean = false;
      
      private var var_760:BitmapData;
      
      private var var_3041:Date;
      
      public function Effect()
      {
         super();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get duration() : int
      {
         return this.var_1838;
      }
      
      public function get effectsInInventory() : int
      {
         return this.var_1145;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_550;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_2206;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get icon() : BitmapData
      {
         return this.var_760;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_760;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(this.var_550)
         {
            _loc1_ = this.var_1707 - (new Date().valueOf() - this.var_3041.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return this.var_1707;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1838 = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         this.var_1707 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_2206 = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_760 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         this.var_1145 = param1;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !this.var_550)
         {
            this.var_3041 = new Date();
         }
         this.var_550 = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --this.var_1145;
         if(this.var_1145 < 0)
         {
            this.var_1145 = 0;
         }
         this.var_1707 = this.var_1838;
         this.var_550 = false;
         this.var_2206 = false;
      }
   }
}
