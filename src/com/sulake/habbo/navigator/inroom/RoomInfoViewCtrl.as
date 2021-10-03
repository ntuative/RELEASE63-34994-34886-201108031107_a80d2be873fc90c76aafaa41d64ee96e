package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_203:IWindowContainer;
      
      private var var_3120:int;
      
      private var var_421:RoomEventViewCtrl;
      
      private var var_422:Timer;
      
      private var var_163:RoomSettingsCtrl;
      
      private var var_308:RoomThumbnailCtrl;
      
      private var var_1141:TagRenderer;
      
      private var var_419:IWindowContainer;
      
      private var var_420:IWindowContainer;
      
      private var var_752:IWindowContainer;
      
      private var var_2204:IWindowContainer;
      
      private var var_2203:IWindowContainer;
      
      private var var_1403:IWindowContainer;
      
      private var var_1041:ITextWindow;
      
      private var var_1143:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_930:ITextWindow;
      
      private var var_1404:ITextWindow;
      
      private var var_1142:ITextWindow;
      
      private var var_929:ITextWindow;
      
      private var var_1702:ITextWindow;
      
      private var var_309:IWindowContainer;
      
      private var var_933:IWindowContainer;
      
      private var var_1706:IWindowContainer;
      
      private var var_2205:ITextWindow;
      
      private var var_751:ITextWindow;
      
      private var var_2202:IWindow;
      
      private var var_1399:IContainerButtonWindow;
      
      private var var_1400:IContainerButtonWindow;
      
      private var var_1398:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1402:IContainerButtonWindow;
      
      private var var_1705:IButtonWindow;
      
      private var var_1701:IButtonWindow;
      
      private var var_1704:IButtonWindow;
      
      private var var_931:IWindowContainer;
      
      private var var_1401:ITextWindow;
      
      private var var_1144:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_932:IButtonWindow;
      
      private var var_1703:Boolean = false;
      
      private const const_1020:int = 75;
      
      private const const_969:int = 3;
      
      private const const_874:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_421 = new RoomEventViewCtrl(this._navigator);
         this.var_163 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_308 = new RoomThumbnailCtrl(this._navigator);
         this.var_1141 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_163);
         this.var_422 = new Timer(6000,1);
         this.var_422.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_422)
         {
            this.var_422.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_422.reset();
            this.var_422 = null;
         }
         this._navigator = null;
         this.var_421 = null;
         this.var_163 = null;
         this.var_308 = null;
         if(this.var_1141)
         {
            this.var_1141.dispose();
            this.var_1141 = null;
         }
         this.var_203 = null;
         this.var_419 = null;
         this.var_420 = null;
         this.var_752 = null;
         this.var_2204 = null;
         this.var_2203 = null;
         this.var_1403 = null;
         this.var_1041 = null;
         this.var_1143 = null;
         this._ownerName = null;
         this.var_930 = null;
         this.var_1404 = null;
         this.var_1142 = null;
         this.var_929 = null;
         this.var_1702 = null;
         this.var_309 = null;
         this.var_933 = null;
         this.var_1706 = null;
         this.var_2205 = null;
         this.var_751 = null;
         this.var_2202 = null;
         this.var_1399 = null;
         this.var_1400 = null;
         this.var_1398 = null;
         this._remFavouriteButton = null;
         this.var_1402 = null;
         this.var_1705 = null;
         this.var_1701 = null;
         this.var_1704 = null;
         this.var_931 = null;
         this.var_1401 = null;
         this.var_1144 = null;
         this._buttons = null;
         this.var_932 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_422.reset();
         this.var_421.active = true;
         this.var_163.active = false;
         this.var_308.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_422.reset();
         this.var_163.load(param1);
         this.var_163.active = true;
         this.var_421.active = false;
         this.var_308.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_163.active = true;
         this.var_421.active = false;
         this.var_308.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_422.reset();
         this.var_163.active = false;
         this.var_421.active = false;
         this.var_308.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1703 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_422.reset();
         this.var_421.active = false;
         this.var_163.active = false;
         this.var_308.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_969;
         this._window.y = this.const_1020;
         if(this._navigator.configuration.getBoolean("club.membership.extend.vip.promotion.enabled",false) || this._navigator.configuration.getBoolean("club.membership.extend.basic.promotion.enabled",false))
         {
            this._window.y = 91;
         }
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_203,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_203.height = Util.getLowestPoint(this.var_203);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_874;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_419);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_163.refresh(this.var_419);
         this.var_308.refresh(this.var_419);
         Util.moveChildrenToColumn(this.var_419,["room_details","room_buttons"],0,2);
         this.var_419.height = Util.getLowestPoint(this.var_419);
         this.var_419.visible = true;
         Logger.log("XORP: " + this.var_420.visible + ", " + this.var_1403.visible + ", " + this.var_752.visible + ", " + this.var_752.rectangle + ", " + this.var_419.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_309);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_421.refresh(this.var_309);
         if(Util.hasVisibleChildren(this.var_309) && !(this.var_163.active || this.var_308.active))
         {
            Util.moveChildrenToColumn(this.var_309,["event_details","event_buttons"],0,2);
            this.var_309.height = Util.getLowestPoint(this.var_309);
            this.var_309.visible = true;
         }
         else
         {
            this.var_309.visible = false;
         }
         Logger.log("EVENT: " + this.var_309.visible + ", " + this.var_309.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","AnimationAction") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_163.active && !this.var_308.active && !this.var_421.active)
         {
            this.var_931.visible = true;
            this.var_1144.text = this.getEmbedData();
         }
         else
         {
            this.var_931.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_163.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_932)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_932.visible = _loc1_;
            if(this.var_1703)
            {
               this.var_932.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_932.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_163.active || this.var_308.active)
         {
            return;
         }
         this.var_1041.text = param1.roomName;
         this.var_1041.height = this.var_1041.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_930.text = param1.description;
         this.var_1141.refreshTags(this.var_420,param1.tags);
         this.var_930.visible = false;
         if(param1.description != "")
         {
            this.var_930.height = this.var_930.textHeight + 5;
            this.var_930.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1400,"facebook_logo_small",_loc3_,null,0);
         this.var_1400.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1399,"thumb_up",_loc4_,null,0);
         this.var_1399.visible = _loc4_;
         this.var_929.visible = !_loc4_;
         this.var_1702.visible = !_loc4_;
         this.var_1702.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_420,"home",param2,null,0);
         this._navigator.refreshButton(this.var_420,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_420,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_1041.y,0);
         this.var_420.visible = true;
         this.var_420.height = Util.getLowestPoint(this.var_420);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_420.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_163.active || this.var_308.active)
         {
            return;
         }
         this.var_1143.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1143.height = this.var_1143.textHeight + 5;
         this.var_1404.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1404.height = this.var_1404.textHeight + 5;
         Util.moveChildrenToColumn(this.var_752,["public_space_name","public_space_desc"],this.var_1143.y,0);
         this.var_752.visible = true;
         this.var_752.height = Math.max(86,Util.getLowestPoint(this.var_752));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_421.active)
         {
            return;
         }
         this.var_2205.text = param1.eventName;
         this.var_751.text = param1.eventDescription;
         this.var_1141.refreshTags(this.var_933,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_751.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_751.height = this.var_751.textHeight + 5;
            this.var_751.y = Util.getLowestPoint(this.var_933) + 2;
            this.var_751.visible = true;
         }
         this.var_933.visible = true;
         this.var_933.height = Util.getLowestPoint(this.var_933);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_163.active || this.var_308.active)
         {
            return;
         }
         this.var_1705.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1398.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1402.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1403.visible = Util.hasVisibleChildren(this.var_1403);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_421.active)
         {
            return;
         }
         this.var_1701.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1704.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1706.visible = Util.hasVisibleChildren(this.var_1706);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_203 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_419 = IWindowContainer(this.find("room_info"));
         this.var_420 = IWindowContainer(this.find("room_details"));
         this.var_752 = IWindowContainer(this.find("public_space_details"));
         this.var_2204 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2203 = IWindowContainer(this.find("rating_cont"));
         this.var_1403 = IWindowContainer(this.find("room_buttons"));
         this.var_1041 = ITextWindow(this.find("room_name"));
         this.var_1143 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_930 = ITextWindow(this.find("room_desc"));
         this.var_1404 = ITextWindow(this.find("public_space_desc"));
         this.var_1142 = ITextWindow(this.find("owner_caption"));
         this.var_929 = ITextWindow(this.find("rating_caption"));
         this.var_1702 = ITextWindow(this.find("rating_txt"));
         this.var_309 = IWindowContainer(this.find("event_info"));
         this.var_933 = IWindowContainer(this.find("event_details"));
         this.var_1706 = IWindowContainer(this.find("event_buttons"));
         this.var_2205 = ITextWindow(this.find("event_name"));
         this.var_751 = ITextWindow(this.find("event_desc"));
         this.var_1400 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1399 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2202 = this.find("staff_pick_button");
         this.var_1398 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1402 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1705 = IButtonWindow(this.find("room_settings_button"));
         this.var_1701 = IButtonWindow(this.find("create_event_button"));
         this.var_1704 = IButtonWindow(this.find("edit_event_button"));
         this.var_931 = IWindowContainer(this.find("embed_info"));
         this.var_1401 = ITextWindow(this.find("embed_info_txt"));
         this.var_1144 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_932 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1398,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1705,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1402,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1701,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1704,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1144,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1399,this.onThumbUp);
         this.addMouseClickListener(this.var_2202,this.onStaffPick);
         this.addMouseClickListener(this.var_1400,this.onFacebookLike);
         this.addMouseClickListener(this.var_932,this.onZoomClick);
         this._navigator.refreshButton(this.var_1398,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1402,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_419,this.onHover);
         this.addMouseOverListener(this.var_309,this.onHover);
         this.var_1142.width = this.var_1142.textWidth;
         Util.moveChildrenToRow(this.var_2204,["owner_caption","owner_name"],this.var_1142.x,this.var_1142.y,3);
         this.var_929.width = this.var_929.textWidth;
         Util.moveChildrenToRow(this.var_2203,["rating_caption","rating_txt"],this.var_929.x,this.var_929.y,3);
         this.var_1401.height = this.var_1401.textHeight + 5;
         Util.moveChildrenToColumn(this.var_931,["embed_info_txt","embed_src_txt"],this.var_1401.y,2);
         this.var_931.height = Util.getLowestPoint(this.var_931) + 5;
         this.var_3120 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1144.setSelection(0,this.var_1144.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_372));
         this.var_1703 = !this.var_1703;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_422.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_163 != null)
         {
            this.var_163.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
