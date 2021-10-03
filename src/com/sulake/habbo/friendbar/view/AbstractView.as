package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDSessionDataManager;
   import iid.IIDHabboWindowManager;
   
   public class AbstractView extends Component
   {
       
      
      protected var _windowManager:IHabboWindowManager;
      
      protected var var_949:IAvatarRenderManager;
      
      protected var var_431:IHabboLocalizationManager;
      
      protected var var_762:IHabboConfigurationManager;
      
      protected var var_387:ISessionDataManager;
      
      public function AbstractView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         queueInterface(new IIDSessionDataManager(),this.onSessionManagerAvailable);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationAvailable);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this._windowManager)
            {
               if(!this._windowManager.disposed)
               {
                  this._windowManager.release(new IIDHabboWindowManager());
                  this._windowManager = null;
               }
            }
            if(this.var_949)
            {
               if(!this.var_949.disposed)
               {
                  this.var_949.release(new IIDAvatarRenderManager());
                  this.var_949 = null;
               }
            }
            if(this.var_431)
            {
               if(!this.var_431.disposed)
               {
                  this.var_431.release(new IIDHabboLocalizationManager());
                  this.var_431 = null;
               }
            }
            if(this.var_762)
            {
               if(!this.var_762.disposed)
               {
                  this.var_762.release(new IIDHabboConfigurationManager());
                  this.var_762 = null;
               }
            }
            if(this.var_387)
            {
               if(!this.var_387.disposed)
               {
                  this.var_387.release(new IIDSessionDataManager());
                  this.var_387 = null;
               }
            }
            super.dispose();
         }
      }
      
      protected function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_949 = param2 as IAvatarRenderManager;
      }
      
      protected function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      protected function onLocalizationAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_431 = param2 as IHabboLocalizationManager;
      }
      
      protected function onConfigurationAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_762 = param2 as IHabboConfigurationManager;
      }
      
      protected function onSessionManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_387 = param2 as ISessionDataManager;
      }
   }
}
