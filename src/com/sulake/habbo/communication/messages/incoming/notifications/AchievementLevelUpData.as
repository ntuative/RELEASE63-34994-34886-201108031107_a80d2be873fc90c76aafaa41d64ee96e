package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1360:int;
      
      private var var_1953:int;
      
      private var var_2619:int;
      
      private var var_2620:int;
      
      private var var_2915:int;
      
      private var var_2166:int;
      
      private var var_2916:String = "";
      
      private var var_2917:String = "";
      
      private var var_2918:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1360 = param1.readInteger();
         this.var_2166 = param1.readInteger();
         this.var_2916 = param1.readString();
         this.var_1953 = param1.readInteger();
         this.var_2619 = param1.readInteger();
         this.var_2620 = param1.readInteger();
         this.var_2915 = param1.readInteger();
         this.var_2918 = param1.readInteger();
         this.var_2917 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1360;
      }
      
      public function get points() : int
      {
         return this.var_1953;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2619;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2620;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2915;
      }
      
      public function get badgeId() : int
      {
         return this.var_2166;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2916;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2917;
      }
      
      public function get achievementID() : int
      {
         return this.var_2918;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
