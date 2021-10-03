package com.sulake.habbo.friendbar.stream
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.EventStreamData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.EventStreamEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.GetEventStreamComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SetEventStreamingAllowedComposer;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarView;
   import com.sulake.habbo.friendbar.utils.LinkTarget;
   import com.sulake.habbo.friendbar.utils.TestMessageWrapper;
   import com.sulake.habbo.friendbar.view.*;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboEventStream extends AbstractView implements IHabboEventStream
   {
      
      private static const const_1538:String = "page_content";
      
      private static const const_1082:String = "page_welcome";
      
      private static const const_1083:String = "page_empty";
      
      private static const const_691:String = "list";
      
      private static const const_462:String = "header";
      
      private static const const_1262:String = "badge";
      
      private static const CLOSE:String = "close";
      
      private static const const_1536:String = "scroll";
      
      private static const const_1087:String = "image";
      
      private static const const_1085:String = "disable_stream";
      
      private static const ACTIVATE:String = "activate_stream";
      
      private static const const_1086:String = "see_more";
      
      private static const const_1532:uint = 0;
      
      private static const const_2108:uint = 1;
      
      private static const const_1534:uint = 4293519841;
      
      private static const const_1537:uint = 4292467926;
      
      private static const const_692:int = -2;
      
      private static const const_1531:int = -3;
      
      private static const const_1084:int = 42;
      
      private static const const_1533:int = 60000;
      
      private static const const_1535:int = 30000;
      
      private static const GENDER_LOCALIZATION_PREFIX:String = "friendbar.stream.";
       
      
      private var var_1921:int = 1;
      
      private var _window:IWindowContainer;
      
      private var var_547:Vector.<EventStreamEntity>;
      
      private var _connection:IConnection;
      
      private var var_805:Boolean = false;
      
      private var var_666:Timer;
      
      private var var_461:Timer;
      
      private var var_994:IHabboFriendBarView;
      
      private var _habboCommunicationManager:IHabboCommunicationManager;
      
      private var var_800:Boolean;
      
      private var var_1538:Vector.<int>;
      
      private var var_1539:Boolean = false;
      
      private var var_2578:Boolean = false;
      
      private var var_2577:Array;
      
      private var var_2579:Array;
      
      private var var_1537:Map;
      
      public function HabboEventStream(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         this.var_1538 = new Vector.<int>();
         this.var_2577 = ["friend_made","room_liked","achievement_earned","motto_changed","room_decorated"];
         this.var_2579 = ["no_link","open_mini_profile","visit_room","open_achievements","open_motto_changer","friend_request"];
         this.var_1537 = new Map();
         super(param1,param2,param3);
         this.var_547 = new Vector.<EventStreamEntity>();
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerAvailable);
         queueInterface(new IIDHabboFriendBarView(),this.onFriendBarViewAvailable);
         this.var_1537.add("m","his");
         this.var_1537.add("f","her");
         if(!this.var_461)
         {
            this.var_461 = new Timer(const_1535);
            this.var_461.addEventListener(TimerEvent.TIMER,this.onRefreshTimerEvent);
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(!this._window)
         {
            this.setupUserInterface();
         }
         this._window.visible = param1;
         if(param1)
         {
            this._window.x = this._window.desktop.width - (this._window.width + const_1531);
            this._window.y = const_692;
            this._window.height = this._window.desktop.height - (const_692 + const_1084);
            this._window.activate();
            if(this.var_800)
            {
               this.requestEventStreamData(this.var_1921);
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return !!this._window ? Boolean(this._window.visible) : false;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_666)
            {
               this.var_666.stop();
               this.var_666.removeEventListener(TimerEvent.TIMER,this.onMinuteTimerEvent);
               this.var_666 = null;
            }
            if(this.var_461)
            {
               this.var_461.stop();
               this.var_461.removeEventListener(TimerEvent.TIMER,this.onRefreshTimerEvent);
               this.var_461 = null;
            }
            while(this.var_547.length > 0)
            {
               this.var_547.pop().dispose();
            }
            if(false)
            {
               EventStreamEntity.name_6.dispose();
            }
            EventStreamEntity.name_6 = null;
            EventStreamEntity.var_2237 = null;
            EventStreamEntity.ASSETS = null;
            if(this._window)
            {
               this._window.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
               this._window.dispose();
               this._window = null;
            }
            if(this._habboCommunicationManager)
            {
               if(!this._habboCommunicationManager.disposed)
               {
                  this._habboCommunicationManager.release(new IIDHabboCommunicationManager());
                  this._habboCommunicationManager = null;
               }
            }
            if(this.var_994)
            {
               if(!this.var_994.disposed)
               {
                  this.var_994.release(new IIDHabboFriendBarView());
                  this.var_994 = null;
               }
            }
            super.dispose();
         }
      }
      
      private function clearStreamList() : void
      {
         var _loc1_:IItemListWindow = this._window.findChildByName(const_691) as IItemListWindow;
         _loc1_.destroyListItems();
         while(this.var_547.length > 0)
         {
            this.var_547.pop().dispose();
         }
      }
      
      public function populate(param1:Vector.<EventStreamData>) : void
      {
         var _loc2_:* = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(!this._window)
         {
            this.setupUserInterface();
         }
         if(this.visible)
         {
            this.clearStreamList();
            _loc2_ = this.var_547.length % 2 == 0;
            _loc4_ = this._window.findChildByName(const_691) as IItemListWindow;
            _loc5_ = 0;
            for each(_loc6_ in param1)
            {
               _loc3_ = EventStreamEntity.allocate();
               _loc3_.title = _loc6_.accountName;
               _loc3_.message = this.resolveMessageText(_loc6_);
               _loc3_.linkTarget = this.resolveLinkTarget(_loc6_);
               _loc3_.minutesElapsed = _loc6_.minutesSinceEvent;
               _loc3_.window.color = !!_loc2_ ? uint(const_1534) : uint(const_1537);
               this.resolveImagePath(_loc3_,_loc6_);
               this.var_547.push(_loc3_);
               _loc4_.addListItem(_loc3_.window);
               _loc2_ = !_loc2_;
               if(this.var_1538.indexOf(_loc6_.id) == -1)
               {
                  _loc5_++;
                  this.var_1538.push(_loc6_.id);
               }
            }
            if(param1.length == 0)
            {
            }
            _loc7_ = this._window.findChildByName(const_462) as IItemListWindow;
            _loc8_ = _loc7_.getListItemByName(const_1262);
            _loc8_.visible = false;
            this.var_1539 = false;
         }
         else
         {
            for each(_loc9_ in param1)
            {
               if(this.var_1538.indexOf(_loc9_.id) == -1)
               {
                  this.var_1539 = true;
                  break;
               }
            }
         }
         this.selectCorrectView();
      }
      
      private function resolveMessageText(param1:EventStreamData) : String
      {
         var _loc6_:* = null;
         var _loc2_:int = param1.actionId;
         var _loc3_:String = "friendbar.stream.type." + this.var_2577[_loc2_];
         var _loc4_:ILocalization = var_431.getLocalization(_loc3_);
         if(!_loc4_)
         {
            return _loc3_;
         }
         var _loc5_:String = _loc4_.raw;
         switch(_loc2_)
         {
            case EventStreamData.const_739:
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.friendName);
               break;
            case EventStreamData.const_1298:
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.roomName);
               break;
            case EventStreamData.const_878:
               _loc5_ = _loc5_.replace("%targetString%",var_431.getAchievementName(param1.extraDataStruct.achievementCode));
               break;
            case EventStreamData.const_1389:
               _loc6_ = var_431.getLocalization(GENDER_LOCALIZATION_PREFIX + this.var_1537.getValue(param1.accountGender));
               _loc5_ = _loc5_.replace("%gender%",_loc6_.value);
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.motto);
               break;
            case EventStreamData.const_1967:
         }
         return _loc5_;
      }
      
      private function resolveLinkTarget(param1:EventStreamData) : LinkTarget
      {
         var _loc3_:* = null;
         var _loc2_:String = "friendbar.stream.link." + this.var_2579[param1.linkTargetType];
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:ILocalization = var_431.getLocalization(_loc2_);
         _loc3_ = !!_loc7_ ? _loc7_.raw : "";
         switch(param1.linkTargetType)
         {
            case EventStreamData.const_2033:
               _loc4_ = 0;
               _loc3_ = "";
               break;
            case EventStreamData.const_1367:
               _loc3_ = _loc3_.replace("%targetString%",param1.extraDataStruct.friendName);
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.friendId);
               break;
            case EventStreamData.const_1999:
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.roomId);
               break;
            case EventStreamData.const_1766:
               _loc4_ = 0;
               break;
            case EventStreamData.LINK_TARGET_OPEN_MOTTO_CHANGER:
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case EventStreamData.const_1763:
               _loc3_ = _loc3_.replace("%targetString%",param1.extraDataStruct.friendName);
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.friendId);
               _loc6_ = param1.extraDataStruct.friendName;
         }
         return new LinkTarget(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      private function resolveImagePath(param1:EventStreamEntity, param2:EventStreamData) : void
      {
         var image:BitmapData = null;
         var callback:Function = null;
         var entity:EventStreamEntity = param1;
         var data:EventStreamData = param2;
         var result:String = data.imageFilePath;
         var action:int = data.actionId;
         switch(action)
         {
            case EventStreamData.const_878:
               image = var_387.requestBadgeImage(data.extraDataStruct.achievementCode);
               if(image)
               {
                  entity.image = image;
               }
               else
               {
                  callback = function(param1:BadgeImageReadyEvent):void
                  {
                     if(param1.badgeId == data.extraDataStruct.achievementCode)
                     {
                        entity.image = param1.badgeImage;
                        var_387.events.removeEventListener(BadgeImageReadyEvent.const_179,arguments.callee);
                     }
                  };
                  var_387.events.addEventListener(BadgeImageReadyEvent.const_179,callback);
               }
               break;
            default:
               entity.imageFilePath = result;
         }
      }
      
      private function setupUserInterface() : void
      {
         var scroll:IScrollbarWindow = null;
         var page:IWindowContainer = null;
         var image:IBitmapWrapperWindow = null;
         var list:IItemListWindow = null;
         var item:IWindowContainer = null;
         if(!this._window)
         {
            this._window = _windowManager.buildFromXML(assets.getAssetByName("event_stream_display_xml").content as XML) as IWindowContainer;
            this._window.height = this._window.desktop.height - (const_692 + const_1084);
            this._window.setParamFlag(WindowParam.const_349);
            this._window.setParamFlag(WindowParam.const_247);
            this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(CLOSE).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(const_1085).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(ACTIVATE).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(const_1086).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.visible = false;
            scroll = this._window.findChildByName(const_1536) as IScrollbarWindow;
            if(scroll)
            {
               scroll.addEventListener(WindowEvent.const_209,function(param1:WindowEvent):void
               {
                  var _loc2_:IScrollbarWindow = param1.target as IScrollbarWindow;
                  if(_loc2_)
                  {
                     _loc2_.visible = true;
                     _loc2_.scrollable.width = _loc2_.scrollable.parent.width - _loc2_.width;
                  }
               });
               scroll.addEventListener(WindowEvent.const_205,function(param1:WindowEvent):void
               {
                  scroll.visible = false;
                  scroll.scrollable.width = scroll.scrollable.parent.width;
               });
               scroll.visible = false;
               scroll.scrollable.width = scroll.scrollable.parent.width;
            }
            page = this._window.findChildByName(const_1082) as IWindowContainer;
            image = page.findChildByName(const_1087) as IBitmapWrapperWindow;
            image.bitmap = assets.getAssetByName(image.bitmapAssetName).content as BitmapData;
            page = this._window.findChildByName(const_1083) as IWindowContainer;
            image = page.findChildByName(const_1087) as IBitmapWrapperWindow;
            image.bitmap = assets.getAssetByName(image.bitmapAssetName).content as BitmapData;
            this.selectCorrectView();
            list = this._window.findChildByName(const_691) as IItemListWindow;
            item = list.removeListItemAt(0) as IWindowContainer;
            EventStreamEntity.name_6 = item;
            EventStreamEntity.var_2237 = var_431;
            EventStreamEntity.ASSETS = assets;
            if(!this.var_666)
            {
               this.var_666 = new Timer(const_1533);
               this.var_666.addEventListener(TimerEvent.TIMER,this.onMinuteTimerEvent);
               this.var_666.start();
            }
         }
      }
      
      private function selectCorrectView() : void
      {
         var _loc1_:IWindow = this._window.findChildByName(const_1538);
         var _loc2_:IWindow = this._window.findChildByName(const_1082);
         var _loc3_:IWindow = this._window.findChildByName(const_1083);
         if(this.var_800)
         {
            _loc1_.visible = true;
            _loc2_.visible = false;
            _loc3_.visible = this.var_547.length == 0;
         }
         else
         {
            _loc1_.visible = false;
            _loc2_.visible = true;
            _loc3_.visible = false;
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case CLOSE:
               this.visible = false;
               break;
            case const_1085:
               this.changeStreamState(false);
               break;
            case ACTIVATE:
               this.changeStreamState(true);
               break;
            case const_1086:
               _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,null);
               HabboWebTools.openWebPage(var_762.getKey("link.friendbar.stream.settings.see.more",""));
         }
      }
      
      private function changeStreamState(param1:Boolean) : void
      {
         this.var_800 = param1;
         this.sendSetEventStreamingEnabled(param1);
         this.selectCorrectView();
         if(param1)
         {
            this.var_461.start();
            this.refreshEventStream();
         }
         else
         {
            this.var_461.stop();
         }
         Logger.log("Streaming enabled: " + param1);
      }
      
      private function onMinuteTimerEvent(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_547)
         {
            _loc2_.minutesElapsed += 1;
         }
      }
      
      private function onRefreshTimerEvent(param1:TimerEvent) : void
      {
         if(this.visible || !this.var_1539)
         {
            this.requestEventStreamData(this.var_1921);
         }
      }
      
      private function requestEventStreamData(param1:uint) : void
      {
         if(this._connection && this._connection.connected && this.var_2578)
         {
            this._connection.send(new GetEventStreamComposer(param1 == const_1532 ? 0 : int(GetEventStreamComposer.const_1862)));
            this.var_805 = true;
            Logger.log("Requested stream events in mode " + param1);
         }
      }
      
      private function onCommunicationManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._habboCommunicationManager = param2 as IHabboCommunicationManager;
         this._habboCommunicationManager.addHabboConnectionMessageEvent(new EventStreamEvent(this.onEventStreamEvent));
         this._habboCommunicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObjectEvent));
         this._connection = this._habboCommunicationManager.getHabboMainConnection(this.onConnectionInstanceAvailable);
      }
      
      private function onConnectionInstanceAvailable(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      private function onEventStreamEvent(param1:EventStreamEvent) : void
      {
         this.populate(param1.events);
         this.var_994.setStreamIconNotify(!this.visible && this.var_1539);
      }
      
      private function testEventStream(param1:int = 1) : void
      {
         var _loc2_:Vector.<EventStreamData> = new Vector.<EventStreamData>();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_.push(new EventStreamData(_loc3_,EventStreamData.const_739,String(_loc3_ * 1000),"FooBar" + _loc3_,"m","http://d63.varoke.net/habbo-imaging/badge/b1003Xs05175s05173s091145ec244dcc5eaf54aaabf367665f39c67.gif",_loc3_,EventStreamData.const_1367,new TestMessageWrapper(["1234","Friend\'s friend" + _loc3_])));
            _loc3_++;
         }
         this.populate(_loc2_);
      }
      
      private function onFriendBarViewAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_994 = param2 as IHabboFriendBarView;
      }
      
      override protected function onConfigurationAvailable(param1:IID, param2:IUnknown) : void
      {
         super.onConfigurationAvailable(param1,param2);
         this.var_2578 = var_762.getKey("friendbar.stream.enabled","AnimationAction") == "true";
      }
      
      private function sendSetEventStreamingEnabled(param1:Boolean) : void
      {
         if(this._connection && this._connection.connected)
         {
            this._connection.send(new SetEventStreamingAllowedComposer(param1));
         }
      }
      
      private function onUserObjectEvent(param1:UserObjectEvent) : void
      {
         this.var_800 = param1.getParser().streamPublishingAllowed;
         if(this.var_800)
         {
            this.var_461.start();
         }
         Logger.log("Stream events allowed " + this.var_800);
      }
      
      public function refreshEventStream() : void
      {
         if(this.var_800)
         {
            this.requestEventStreamData(this.var_1921);
         }
      }
   }
}
