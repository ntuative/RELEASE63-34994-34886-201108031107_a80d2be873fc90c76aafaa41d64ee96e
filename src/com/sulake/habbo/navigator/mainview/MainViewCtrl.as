package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.TextSearchInputs;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_633:int = 1;
      
      public static const const_1336:int = 2;
      
      public static const const_2322:int = 3;
      
      public static const const_1303:int = 4;
      
      private static const const_1140:int = 1;
      
      private static const const_713:int = 2;
      
      private static const const_1139:int = 3;
      
      private static const const_1676:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_16:IFrameWindow;
      
      private var var_203:IWindowContainer;
      
      private var var_257:IWindowContainer;
      
      private var var_295:IWindowContainer;
      
      private var var_229:IWindowContainer;
      
      private var var_1085:PopularTagsListCtrl;
      
      private var var_1086:GuestRoomListCtrl;
      
      private var var_1347:OfficialRoomListCtrl;
      
      private var var_290:ITabContextWindow;
      
      private var var_2107:Boolean;
      
      private var var_725:int;
      
      private var var_1349:Boolean = true;
      
      private var var_1638:int = 0;
      
      private var var_1639:IWindow;
      
      private var var_876:IRegionWindow;
      
      private var var_2910:int = 0;
      
      private var var_1348:TextSearchInputs;
      
      private var var_558:Timer;
      
      private var _disposed:Boolean = false;
      
      private var var_804:WindowToggle;
      
      private const const_2104:Point = new Point(100,10);
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_1085 = new PopularTagsListCtrl(this._navigator);
         this.var_1086 = new GuestRoomListCtrl(this._navigator);
         this.var_1347 = new OfficialRoomListCtrl(this._navigator);
         this.var_558 = new Timer(300,1);
         this.var_558.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function method_5() : Boolean
      {
         if(!this.var_16)
         {
            this.reloadData();
            return true;
         }
         if(!this.var_804 || this.var_804.disposed)
         {
            this.var_804 = new WindowToggle(this.var_16,this.var_16.desktop,this.reloadData,this.close);
         }
         var _loc1_:int = this.var_804.toggle();
         return _loc1_ == WindowToggle.RESULT_SHOW;
      }
      
      private function reloadData() : void
      {
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this._navigator = null;
            if(this.var_16)
            {
               this.var_16.dispose();
               this.var_16 = null;
            }
            if(this.var_804)
            {
               this.var_804.dispose();
               this.var_804 = null;
            }
            if(this.var_203)
            {
               this.var_203.dispose();
               this.var_203 = null;
            }
            if(this.var_558)
            {
               this.var_558.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_558.reset();
               this.var_558 = null;
            }
            if(this.var_1085)
            {
               this.var_1085.dispose();
               this.var_1085 = null;
            }
            if(this.var_1086)
            {
               this.var_1086.dispose();
               this.var_1086 = null;
            }
            if(this.var_1347)
            {
               this.var_1347.dispose();
               this.var_1347 = null;
            }
            if(this.var_1348)
            {
               this.var_1348.dispose();
               this.var_1348 = null;
            }
         }
      }
      
      public function open() : void
      {
         if(this.var_16 == null)
         {
            this.prepare();
         }
         this.refresh();
         this.var_16.visible = true;
         this.var_16.activate();
      }
      
      public function isOpen() : Boolean
      {
         return this.var_16 != null && this.var_16.visible;
      }
      
      public function close() : void
      {
         if(this.var_16 != null)
         {
            this.var_16.visible = false;
         }
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return this.var_16;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_16 = IFrameWindow(this._navigator.getXmlWindow("grs_main_window"));
         this.var_290 = ITabContextWindow(this.var_16.findChildByName("tab_context"));
         this.var_203 = IWindowContainer(this.var_16.findChildByName("tab_content"));
         this.var_257 = IWindowContainer(this.var_16.findChildByName("custom_content"));
         this.var_229 = IWindowContainer(this.var_16.findChildByName("list_content"));
         this.var_295 = IWindowContainer(this.var_16.findChildByName("custom_footer"));
         this.var_1639 = this.var_16.findChildByName("loading_text");
         var _loc1_:IWindow = this.var_16.findChildByTag("close");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onWindowClose);
         }
         this.var_876 = IRegionWindow(this.var_16.findChildByName("to_hotel_view"));
         if(this.var_876 != null)
         {
            this.var_876.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onHotelViewMouseOver);
            this.var_876.addEventListener(WindowMouseEvent.const_25,this.onHotelViewMouseOut);
            this.var_876.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onHotelViewMouseClick);
         }
         this.refreshToHotelViewButton(false);
         this.var_16.addEventListener(WindowEvent.const_41,this.onWindowResized);
         for each(_loc2_ in this._navigator.tabs.tabs)
         {
            _loc3_ = this.var_290.getTabItemByID(_loc2_.id);
            if(_loc3_ != null)
            {
               _loc3_.addEventListener(WindowEvent.const_47,this.onTabSelected);
               _loc2_.button = _loc3_;
            }
         }
         this.var_16.scaler.setParamFlag(HabboWindowParam.const_741,false);
         this.var_16.scaler.setParamFlag(HabboWindowParam.const_1850,true);
         this.var_16.position = this.const_2104;
         this.createSearchInput();
      }
      
      private function createSearchInput() : void
      {
         var _loc3_:* = null;
         if(this.var_1348 == null)
         {
            _loc3_ = this.var_16.findChildByName("search_header") as IWindowContainer;
            this.var_1348 = new TextSearchInputs(this._navigator,_loc3_);
         }
         var _loc2_:IWindowContainer = this.var_16.findChildByName("search_header") as IWindowContainer;
         _loc2_.visible = true;
      }
      
      public function refresh() : void
      {
         if(this.var_16 == null)
         {
            return;
         }
         this.refreshTab();
         this.refreshCustomContent();
         this.refreshListContent(true);
         this.refreshFooter();
         this.var_257.height = Util.getLowestPoint(this.var_257);
         this.var_295.height = Util.getLowestPoint(this.var_295);
         var _loc1_:int = this.var_229.y;
         Util.moveChildrenToColumn(this.var_203,["custom_content","list_content"],this.var_257.y,8);
         this.var_229.height = this.var_229.height + _loc1_ - this.var_229.y - this.var_295.height + this.var_2910;
         Util.moveChildrenToColumn(this.var_203,["list_content","custom_footer"],this.var_229.y,0);
         this.var_2910 = this.var_295.height;
         this.onResizeTimer(null);
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = this.var_290.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            this.var_2107 = true;
            this.var_290.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(this.var_257);
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(this.var_257);
         if(Util.hasVisibleChildren(this.var_257))
         {
            this.var_257.visible = true;
         }
         else
         {
            this.var_257.visible = false;
            this.var_257.blend = 1;
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(this.var_295);
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(this.var_295);
         if(Util.hasVisibleChildren(this.var_295))
         {
            this.var_295.visible = true;
         }
         else
         {
            this.var_295.visible = false;
         }
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(this.var_229);
         this.refreshGuestRooms(param1,this._navigator.data.guestRoomSearchArrived);
         this.refreshPopularTags(param1,this._navigator.data.popularTagsArrived);
         this.refreshOfficialRooms(param1,this._navigator.data.method_17);
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         this.refreshList(param1,param2,this.var_1086,"guest_rooms");
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         this.refreshList(param1,param2,this.var_1085,"popular_tags");
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         this.refreshList(param1,param2,this.var_1347,"official_rooms");
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(param2)
         {
            if(param3.content == null)
            {
               _loc5_ = this.var_229.findChildByName(param4);
               param3.content = IWindowContainer(_loc5_);
            }
            if(param1)
            {
               param3.refresh();
            }
            param3.content.visible = true;
         }
      }
      
      private function onWindowClose(param1:WindowEvent) : void
      {
         Logger.log("Close navigator window");
         this.close();
      }
      
      private function onTabSelected(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.target;
         var _loc3_:int = _loc2_.id;
         if(this.var_2107)
         {
            this.var_2107 = false;
            return;
         }
         var _loc4_:Tab = this._navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_367:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_281:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_376:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_206:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_292:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            this.startSearch(this._navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = this._navigator.tabs.getSelected();
         this._navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = this._navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1349 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         this._navigator.data.startLoading();
         if(param4 == const_633)
         {
            this._navigator.send(this.getSearchMsg(param2,param3));
         }
         else if(param4 == const_1336)
         {
            this._navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            this._navigator.send(new GetOfficialRoomsMessageComposer(this._navigator.data.adIndex));
         }
         if(!this.isOpen())
         {
            this.open();
            this.var_725 = const_713;
            this.var_229.blend = 0;
            if(this.var_257.visible)
            {
               this.var_257.blend = 0;
               this.var_295.blend = 0;
            }
         }
         else
         {
            this.var_725 = const_1140;
         }
         this.var_1638 = 0;
         this._navigator.registerUpdateReceiver(this,2);
         this.sendTrackingEvent(param2);
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_582:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_1023:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_817:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_801:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_315:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_938:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_459:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_744:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_856:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_605:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_418:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_1023)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_817)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_801)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_315)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_459)
         {
            return new PopularRoomsSearchMessageComposer(param2,this._navigator.data.adIndex);
         }
         if(param1 == Tabs.const_744)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_856)
         {
            return new RoomsWithHighestScoreSearchMessageComposer(this._navigator.data.adIndex);
         }
         if(param1 == Tabs.const_605)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_418)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_582)
         {
            return new LatestEventsSearchMessageComposer(param2,this._navigator.data.adIndex);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_229 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(this.var_725 == const_1140)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_229.blend - _loc2_));
            this.var_229.blend = _loc3_;
            this.var_257.blend = !!this.var_1349 ? Number(_loc3_) : Number(1);
            this.var_295.blend = !!this.var_1349 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               this.var_725 = const_713;
            }
         }
         else if(this.var_725 == const_713)
         {
            if(this.var_1638 % 10 == 1)
            {
               this.var_1639.visible = !this.var_1639.visible;
            }
            ++this.var_1638;
            if(!this._navigator.data.isLoading())
            {
               this.var_725 = const_1139;
            }
         }
         else if(this.var_725 == const_1139)
         {
            this.refresh();
            this.var_725 = const_1676;
         }
         else
         {
            this.var_1639.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_229.blend + _loc2_));
            this.var_229.blend = _loc3_;
            this.var_257.blend = !!this.var_1349 ? Number(_loc3_) : Number(1);
            this.var_295.blend = !!this.var_1349 ? Number(_loc3_) : Number(1);
            if(this.var_229.blend >= 1)
            {
               this._navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.target;
         if(_loc2_ != this.var_16)
         {
            return;
         }
         if(!this.var_558.running)
         {
            this.var_558.reset();
            this.var_558.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         this.refreshScrollbar(this.var_1085);
         this.refreshScrollbar(this.var_1086);
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         this._navigator.refreshButton(this.var_876,"icon_hotelview",!param1,null,0);
         this._navigator.refreshButton(this.var_876,"icon_hotelview_reactive",param1,null,0);
      }
      
      private function onHotelViewMouseOver(param1:WindowEvent) : void
      {
         this.refreshToHotelViewButton(true);
      }
      
      private function onHotelViewMouseOut(param1:WindowEvent) : void
      {
         this.refreshToHotelViewButton(false);
      }
      
      private function onHotelViewMouseClick(param1:WindowEvent) : void
      {
         this._navigator.send(new QuitMessageComposer());
      }
   }
}
