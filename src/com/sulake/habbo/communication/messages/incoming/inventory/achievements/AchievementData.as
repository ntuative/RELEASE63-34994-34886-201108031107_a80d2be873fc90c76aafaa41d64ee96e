package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1360:int;
      
      private var var_2166:String;
      
      private var var_1946:int;
      
      private var var_2619:int;
      
      private var var_2620:int;
      
      private var var_1945:int;
      
      private var var_1947:Boolean;
      
      private var _category:String;
      
      private var var_2618:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1360 = param1.readInteger();
         this.var_2166 = param1.readString();
         this.var_1946 = Math.max(1,param1.readInteger());
         this.var_2619 = param1.readInteger();
         this.var_2620 = param1.readInteger();
         this.var_1945 = param1.readInteger();
         this.var_1947 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2618 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_2166;
      }
      
      public function get level() : int
      {
         return this.var_1360;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1946;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2619;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2620;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1945;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1947;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2618;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1360 > 1 || this.var_1947;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1945 = this.var_1946;
      }
   }
}
