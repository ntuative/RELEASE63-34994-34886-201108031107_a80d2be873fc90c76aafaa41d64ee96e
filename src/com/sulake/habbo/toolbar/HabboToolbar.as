package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.extensions.ClubDiscountPromoExtension;
   import com.sulake.habbo.toolbar.extensions.ExtraToolsExtension;
   import com.sulake.habbo.toolbar.extensions.purse.PurseExtension;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import iid.IIDHabboWindowManager;
   
   public class HabboToolbar extends Component implements IHabboToolbar
   {
      
      private static const const_1648:String = "purse";
      
      private static const const_1649:String = "extra_tools";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_298:IHabboCommunicationManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _view:ToolbarView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _isInitialized:Boolean;
      
      private var var_712:ExtraToolsExtension;
      
      private var _connection:IConnection;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1325:PurseExtension;
      
      private var var_1619:ClubDiscountPromoExtension;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_12:IHabboInventory;
      
      private var var_711:ExtensionView;
      
      public function HabboToolbar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         lock();
         this._assetLibrary = param3;
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDCoreLocalizationManager(),this.onLocalizationManagerReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
      }
      
      override public function dispose() : void
      {
         this._isInitialized = false;
         this._connection = null;
         if(this.var_711)
         {
            this.var_711.dispose();
            this.var_711 = null;
         }
         if(this.var_1619)
         {
            this.var_1619.dispose();
            this.var_1619 = null;
         }
         if(this.var_1325)
         {
            this.var_1325.dispose();
            this.var_1325 = null;
         }
         if(this.var_712)
         {
            this.var_712.dispose();
            this.var_712 = null;
         }
         if(this.var_298)
         {
            this.var_298.release(new IIDHabboCommunicationManager());
            this.var_298 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._config)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_298 = IHabboCommunicationManager(param2);
         this._connection = this.var_298.getHabboMainConnection(null);
         this.tryInitialize();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         this.tryInitialize();
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._config = IHabboConfigurationManager(param2);
         this.tryInitialize();
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = ICoreLocalizationManager(param2);
         this.tryInitialize();
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_12 = IHabboInventory(param2);
         this.tryInitialize();
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._catalog = param2 as IHabboCatalog;
         this.tryInitialize();
      }
      
      private function tryInitialize() : void
      {
         if(this.var_298 && this._windowManager && this._config && this._localization && this.var_12 && this._catalog)
         {
            this.var_298.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
            unlock();
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         this._view = new ToolbarView(this,this._windowManager,this._assetLibrary,this._connection,this._catalog,events,this._config);
         if(this._config && this._config.getKey("client.logout.enabled","AnimationAction") == "true")
         {
            this.var_711 = new ExtensionView(this._windowManager,this._assetLibrary,this);
            if(this.var_711)
            {
               this.var_1325 = new PurseExtension(this._windowManager,this._assetLibrary,this._config,this._catalog,this.var_12,this._localization);
               this.var_712 = new ExtraToolsExtension(this,this._windowManager,this._assetLibrary,events,this._config);
               if(this._config.getBoolean("club.membership.extend.vip.promotion.enabled",false) || this._config.getBoolean("club.membership.extend.basic.promotion.enabled",false))
               {
                  this.var_1619 = new ClubDiscountPromoExtension(this,this._windowManager,this._assetLibrary,events,this._config,this._localization,this.var_12,this._catalog,this._connection);
               }
               this.var_711.attachExtension(const_1648,this.var_1325.window,ExtensionFixedSlotsEnum.const_1816);
               this.var_711.attachExtension(const_1649,this.var_712.window,ExtensionFixedSlotsEnum.const_1965);
            }
         }
         if(this._view == null)
         {
            Logger.log("Error, toolbar view was not available");
            return;
         }
         this._isInitialized = true;
      }
      
      public function toggleWindowVisibility(param1:String) : void
      {
         var _loc2_:String = "null";
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_48);
         _loc3_.iconId = _loc2_;
         _loc3_.iconName = param1;
         events.dispatchEvent(_loc3_);
         var _loc4_:EventLogMessageComposer = new EventLogMessageComposer("Toolbar",param1,"client.toolbar.clicked");
         if(this._connection)
         {
            this._connection.send(_loc4_);
         }
      }
      
      public function getIconVerticalLocation(param1:String) : int
      {
         return this._view.getIconVerticalLocation(param1);
      }
      
      public function setUnseenItemCount(param1:String, param2:int) : void
      {
         this._view.setUnseenItemCount(param1,param2);
      }
      
      public function setToolbarState(param1:String) : void
      {
         switch(param1)
         {
            case HabboToolbarEnum.const_1003:
               this.toolbarExtensionVisible(false);
               break;
            case HabboToolbarEnum.const_746:
               this.toolbarExtensionVisible(true);
         }
         if(this._view)
         {
            this._view.setToolbarState(param1);
         }
      }
      
      private function toolbarExtensionVisible(param1:Boolean) : void
      {
         if(!this.var_712)
         {
            return;
         }
         if(param1)
         {
            this.var_712.showRoomInfo();
         }
         else
         {
            this.var_712.hideRoomInfo();
         }
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         if(this._view)
         {
            this._view.setIconBitmap(param1,param2);
         }
      }
      
      public function getRect() : Rectangle
      {
         if(this._view)
         {
            return this._view.window.rectangle.clone();
         }
         return new Rectangle();
      }
      
      public function get extensionView() : IExtensionView
      {
         return this.var_711;
      }
   }
}
