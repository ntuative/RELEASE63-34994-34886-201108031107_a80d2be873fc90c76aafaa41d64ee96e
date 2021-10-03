package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2115:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_226:MsgWithRequestId;
      
      private var var_697:RoomEventData;
      
      private var var_2816:Boolean;
      
      private var var_2815:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2439:int;
      
      private var var_285:GuestRoomData;
      
      private var var_1052:PublicRoomShortData;
      
      private var var_2817:int;
      
      private var var_2813:Boolean;
      
      private var var_2814:int;
      
      private var var_2818:Boolean;
      
      private var var_2040:int;
      
      private var var_2810:Boolean;
      
      private var var_1585:Array;
      
      private var var_1602:Array;
      
      private var var_2809:int;
      
      private var var_1601:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1312:Boolean;
      
      private var var_2819:int;
      
      private var var_2812:Boolean;
      
      private var var_2811:int = 0;
      
      private var var_2039:OfficialRoomEntryData;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1585 = new Array();
         this.var_1602 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_285 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_285 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1052 = null;
         this.var_285 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1052 = param1.publicSpace;
            this.var_697 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_697 != null)
         {
            this.var_697.dispose();
            this.var_697 = null;
         }
         if(this.var_1052 != null)
         {
            this.var_1052.dispose();
            this.var_1052 = null;
         }
         if(this.var_285 != null)
         {
            this.var_285.dispose();
            this.var_285 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_285 != null)
         {
            this.var_285.dispose();
         }
         this.var_285 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_697 != null)
         {
            this.var_697.dispose();
         }
         this.var_697 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_226 != null && this.var_226 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_226 != null && this.var_226 as GuestRoomSearchResultData != null;
      }
      
      public function get method_17() : Boolean
      {
         return this.var_226 != null && this.var_226 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_226 = param1;
         this.var_2039 = param1.ad;
         this.var_1312 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_226 = param1;
         this.var_1312 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_226 = param1;
         this.var_1312 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_226 == null)
         {
            return;
         }
         this.var_226.dispose();
         this.var_226 = null;
      }
      
      public function set adRoom(param1:OfficialRoomEntryData) : void
      {
         this.var_2039 = param1;
      }
      
      public function get adRoom() : OfficialRoomEntryData
      {
         return this.var_2039;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_226 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_226 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_226 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_697;
      }
      
      public function get avatarId() : int
      {
         return this.var_2439;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2816;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2815;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_285;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1052;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2813;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2814;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_2040;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2818;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2819;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2817;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2810;
      }
      
      public function get adIndex() : int
      {
         return this.var_2811;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2812;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2439 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2814 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2813 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2816 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2815 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2818 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_2040 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2819 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2817 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2810 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2811 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2812 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1585 = param1;
         this.var_1602 = new Array();
         for each(_loc2_ in this.var_1585)
         {
            if(_loc2_.visible)
            {
               this.var_1602.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1585;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1602;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2809 = param1.limit;
         this.var_1601 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1601 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_285.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_285 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_285.flatId;
         return this.var_2040 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1601 >= this.var_2809;
      }
      
      public function startLoading() : void
      {
         this.var_1312 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1312;
      }
   }
}
