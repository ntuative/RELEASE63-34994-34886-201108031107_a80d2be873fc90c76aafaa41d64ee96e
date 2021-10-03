package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_116:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_157:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_774:int = 2;
      
      public static const const_965:int = 3;
      
      public static const const_1841:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1820:String = "";
      
      private var var_2315:int;
      
      private var var_2317:int = 0;
      
      private var var_2314:int = 0;
      
      private var var_754:String = "";
      
      private var var_48:BitmapData = null;
      
      private var var_239:Array;
      
      private var var_1645:int = 0;
      
      private var var_2711:String = "";
      
      private var var_2710:int = 0;
      
      private var var_2712:int = 0;
      
      private var var_2105:Boolean = false;
      
      private var var_1819:String = "";
      
      private var var_2294:Boolean = false;
      
      private var var_2801:Boolean = false;
      
      private var var_2803:Boolean = true;
      
      private var var_1309:int = 0;
      
      private var var_2806:Boolean = false;
      
      private var var_2800:Boolean = false;
      
      private var var_2805:Boolean = false;
      
      private var var_2808:Boolean = false;
      
      private var var_2807:Boolean = false;
      
      private var var_2804:Boolean = false;
      
      private var var_2802:int = 0;
      
      private var var_2102:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_239 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1820 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1820;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2315 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2315;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2317 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2317;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2314 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2314;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_754 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_48 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_239 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_239;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1645 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1645;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2711 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2711;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2801 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2801;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1309 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1309;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2806 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2806;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2800 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2800;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2805 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2805;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2808 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2808;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2807 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2807;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2804 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2804;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2802 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2802;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2803 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2803;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2102 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2102;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2710 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2710;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2712 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2712;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2105 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2105;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1819 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2294 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2294;
      }
   }
}
