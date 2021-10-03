package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_298:IHabboCommunicationManager;
      
      private var var_431:IHabboLocalizationManager;
      
      private var var_762:IHabboConfigurationManager;
      
      private var var_387:ISessionDataManager;
      
      private var var_1346:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_75:HelpUI;
      
      private var var_123:TutorialUI;
      
      private var var_873:HotelMergeUI;
      
      private var var_1634:CallForHelpData;
      
      private var var_2907:UserRegistry;
      
      private var var_2593:String = "";
      
      private var var_1082:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1634 = new CallForHelpData();
         this.var_2907 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1346 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2593 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2593;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1634;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2907;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_431;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_387;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_123;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_873;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_123)
         {
            return this.var_123.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.dispose();
            this.var_75 = null;
         }
         if(this.var_123 != null)
         {
            this.var_123.dispose();
            this.var_123 = null;
         }
         if(this.var_873)
         {
            this.var_873.dispose();
            this.var_873 = null;
         }
         if(this.var_1346 != null)
         {
            this.var_1346.dispose();
            this.var_1346 = null;
         }
         this._incomingMessages = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_431)
         {
            this.var_431.release(new IIDHabboLocalizationManager());
            this.var_431 = null;
         }
         if(this.var_298)
         {
            this.var_298.release(new IIDHabboCommunicationManager());
            this.var_298 = null;
         }
         if(this.var_762)
         {
            this.var_762.release(new IIDHabboConfigurationManager());
            this.var_762 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_387 != null)
         {
            this.var_387.release(new IIDSessionDataManager());
            this.var_387 = null;
         }
         if(this.var_1082 != null)
         {
            this.var_1082.dispose();
            this.var_1082 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_75 != null)
         {
            this.var_75.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1346;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_298 != null && param1 != null)
         {
            this.var_298.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_762 == null)
         {
            return param1;
         }
         return this.var_762.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_75 != null)
         {
            this.var_75.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1634.reportedUserId = param1;
         this.var_1634.reportedUserName = param2;
         this.var_75.showUI(HabboHelpViewEnum.const_409);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_75 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_75.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_75 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_75 = new HelpUI(this,this._assetLibrary,this._windowManager);
         }
         return this.var_75 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_123 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_123 = new TutorialUI(this,_loc1_);
         }
         return this.var_123 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_123 != null)
         {
            this.var_123.dispose();
            this.var_123 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_873)
         {
            this.var_873 = new HotelMergeUI(this);
         }
         this.var_873.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_123 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_123.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_123)
         {
            this.var_123.showView(TutorialUI.const_340);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_298 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_298);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_431 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_762 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_76,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_81,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_48,this.onHabboToolbarEvent);
         this.createHelpUI();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_387 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_76:
               if(this.var_75 != null)
               {
                  this.var_75.setRoomSessionStatus(true);
               }
               if(this.var_123 != null)
               {
                  this.var_123.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_81:
               if(this.var_75 != null)
               {
                  this.var_75.setRoomSessionStatus(false);
               }
               if(this.var_123 != null)
               {
                  this.var_123.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      public function showWelcomeScreen(param1:WelcomeNotification) : void
      {
         if(!this.var_1082)
         {
            this.var_1082 = new WelcomeScreenController(this,this._windowManager);
         }
         this.var_1082.showWelcomeScreen(param1);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_48)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
            }
         }
      }
   }
}
