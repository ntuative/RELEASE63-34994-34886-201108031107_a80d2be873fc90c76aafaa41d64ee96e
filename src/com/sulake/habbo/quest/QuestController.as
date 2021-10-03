package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var var_51:HabboQuestEngine;
      
      private var var_537:QuestsList;
      
      private var var_449:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_372:QuestTracker;
      
      private var var_655:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this.var_51 = param1;
         this.var_372 = new QuestTracker(this.var_51);
         this.var_537 = new QuestsList(this.var_51);
         this.var_449 = new QuestDetails(this.var_51);
         this._questCompleted = new QuestCompleted(this.var_51);
         this.var_655 = new NextQuestTimer(this.var_51);
      }
      
      public function onToolbarClick() : void
      {
         this.var_537.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_537.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_372.onQuest(param1);
         this.var_449.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_655.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_372.onQuestCompleted(param1);
         this.var_449.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_372.onQuestCancelled();
         this.var_449.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_655.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_372.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_537.onRoomExit();
         this.var_372.onRoomExit();
         this.var_449.onRoomExit();
         this.var_655.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_372.update(param1);
         this.var_655.update(param1);
         this.var_537.update(param1);
         this.var_449.update(param1);
      }
      
      public function dispose() : void
      {
         this.var_51 = null;
         if(this.var_537)
         {
            this.var_537.dispose();
            this.var_537 = null;
         }
         if(this.var_372)
         {
            this.var_372.dispose();
            this.var_372 = null;
         }
         if(this.var_449)
         {
            this.var_449.dispose();
            this.var_449 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_655)
         {
            this.var_655.dispose();
            this.var_655 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_51 == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_537;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_449;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_372;
      }
   }
}
