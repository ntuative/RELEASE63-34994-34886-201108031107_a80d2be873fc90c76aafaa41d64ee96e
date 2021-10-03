package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1893:String;
      
      private var var_1895:int;
      
      private var var_1892:int;
      
      private var var_2015:int;
      
      private var _id:int;
      
      private var var_1891:Boolean;
      
      private var _type:String;
      
      private var var_2532:String;
      
      private var var_2535:int;
      
      private var var_1894:String;
      
      private var var_2534:int;
      
      private var var_2533:int;
      
      private var var_1527:int;
      
      private var var_1896:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_1896 = new Date();
         super();
         this.var_1893 = param1.readString();
         this.var_1895 = param1.readInteger();
         this.var_1892 = param1.readInteger();
         this.var_2015 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1891 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2532 = param1.readString();
         this.var_2535 = param1.readInteger();
         this.var_1894 = param1.readString();
         this.var_2534 = param1.readInteger();
         this.var_2533 = param1.readInteger();
         this.var_1527 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_1893;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1894;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_1895;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_1892;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2015;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1891;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2532;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2535;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2534;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2533;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1527 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_1896.getTime();
         return int(Math.max(0,this.var_1527 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1893;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_1894;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1891 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_1895 >= this.var_1892;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_1896;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1527 = param1;
      }
   }
}
