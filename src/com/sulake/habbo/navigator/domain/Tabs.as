package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_367:int = 1;
      
      public static const const_206:int = 2;
      
      public static const const_281:int = 3;
      
      public static const const_376:int = 4;
      
      public static const const_292:int = 5;
      
      public static const const_459:int = 1;
      
      public static const const_856:int = 2;
      
      public static const const_817:int = 3;
      
      public static const const_744:int = 4;
      
      public static const const_315:int = 5;
      
      public static const const_1023:int = 6;
      
      public static const const_801:int = 7;
      
      public static const const_418:int = 8;
      
      public static const const_605:int = 9;
      
      public static const const_2360:int = 10;
      
      public static const const_938:int = 11;
      
      public static const const_582:int = 12;
       
      
      private var var_459:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_459 = new Array();
         this.var_459.push(new Tab(this._navigator,const_367,const_582,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_633));
         this.var_459.push(new Tab(this._navigator,const_206,const_459,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_633));
         this.var_459.push(new Tab(this._navigator,const_376,const_938,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1303));
         this.var_459.push(new Tab(this._navigator,const_281,const_315,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_633));
         this.var_459.push(new Tab(this._navigator,const_292,const_418,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_1336));
         this.setSelectedTab(const_367);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_376;
      }
      
      public function get tabs() : Array
      {
         return this.var_459;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_459)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_459)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_459)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
