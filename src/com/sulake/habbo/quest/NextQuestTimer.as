package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class NextQuestTimer implements IDisposable
   {
      
      public static const const_757:int = 1000;
      
      private static const const_716:String = "next_quest";
       
      
      private var var_51:HabboQuestEngine;
      
      private var var_129:QuestMessageData;
      
      private var _window:IWindowContainer;
      
      private var var_594:Boolean = false;
      
      private var var_1543:int;
      
      public function NextQuestTimer(param1:HabboQuestEngine)
      {
         super();
         this.var_51 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_51)
         {
            this.var_51.toolbar.extensionView.detachExtension(const_716);
         }
         this.var_51 = null;
         this.var_129 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_51 == null;
      }
      
      public function onQuestCancelled() : void
      {
         this.var_129 = null;
         this.close();
      }
      
      public function onRoomExit() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.findChildByName("more_info_region").visible = false;
            this._window.findChildByName("more_info_txt").visible = false;
         }
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         if(param1.waitPeriodSeconds < 1)
         {
            this.close();
            return;
         }
         this.var_129 = param1;
         this.prepareWindow();
         this.refreshVisibility();
         this._window.visible = true;
         this.var_51.toolbar.extensionView.attachExtension(const_716,this._window);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this.var_51.getXmlWindow("NextQuestTimer"));
         this._window.x = 0;
         this._window.y = 0;
         this._window.findChildByName("more_info_region").procedure = this.onMoreInfo;
         new PendingImage(this.var_51,this._window.findChildByName("quest_timer_expanded"),"quest_timer_expanded");
         new PendingImage(this.var_51,this._window.findChildByName("quest_timer_contracted"),"quest_timer_contracted");
         new PendingImage(this.var_51,this._window.findChildByName("quest_pic_bitmap"),"quest_timer_questionmark");
         this._window.findChildByName("quest_timer_expanded").procedure = this.onToggleExpanded;
         this._window.findChildByName("quest_timer_contracted").procedure = this.onToggleExpanded;
         this.refreshVisibility();
      }
      
      private function refresh() : void
      {
         var _loc1_:int = this.var_129.waitPeriodSeconds;
         if(_loc1_ < 1)
         {
            this.close();
            this.var_129.waitPeriodSeconds = 0;
            this.var_51.questController.onQuest(this.var_129);
         }
         var _loc2_:String = FriendlyTime.getFriendlyTime(this.var_51.localization,_loc1_);
         var _loc3_:* = this.var_129.getCampaignLocalizationKey() + ".delayedmsg";
         this.var_51.localization.registerParameter("quests.nextquesttimer.caption.contracted","time",_loc2_);
         this.var_51.localization.registerParameter(_loc3_,"time",_loc2_);
         this._window.findChildByName("quest_header_txt").caption = this.var_51.localization.getKey("quests.nextquesttimer.caption." + (!!this.var_594 ? "expanded" : "contracted"));
         this._window.findChildByName("desc_txt").caption = this.var_51.localization.getKey(_loc3_,_loc3_);
      }
      
      private function refreshVisibility() : void
      {
         this._window.findChildByName("quest_timer_expanded").visible = this.var_594;
         this._window.findChildByName("quest_timer_contracted").visible = !this.var_594;
         this._window.findChildByName("more_info_txt").visible = this.var_594 && this.var_51.currentlyInRoom;
         this._window.findChildByName("more_info_region").visible = this.var_594 && this.var_51.currentlyInRoom;
         this._window.findChildByName("quest_pic_bitmap").visible = this.var_594;
         this._window.findChildByName("desc_txt").visible = this.var_594;
         this.refresh();
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_51.questController.questDetails.showDetails(this.var_129);
         }
      }
      
      private function onToggleExpanded(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_594 = !this.var_594;
            this.refreshVisibility();
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this._window == null || !this._window.visible)
         {
            return;
         }
         this.var_1543 -= param1;
         if(this.var_1543 > 0)
         {
            return;
         }
         this.var_1543 = const_757;
         this.refresh();
      }
      
      private function getDefaultLocationX() : int
      {
         return 0;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.visible = false;
            this.var_51.toolbar.extensionView.detachExtension(const_716);
         }
      }
      
      private function setQuestImageVisible(param1:Boolean) : void
      {
         this._window.findChildByName("quest_pic_bitmap").visible = param1;
      }
   }
}
