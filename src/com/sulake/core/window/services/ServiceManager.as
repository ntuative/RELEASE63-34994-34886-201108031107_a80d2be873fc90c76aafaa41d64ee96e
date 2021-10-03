package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3112:uint;
      
      private var _root:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_686:IWindowContext;
      
      private var var_1330:IMouseDraggingService;
      
      private var var_1333:IMouseScalingService;
      
      private var var_1329:IMouseListenerService;
      
      private var var_1331:IFocusManagerService;
      
      private var var_1332:IToolTipAgentService;
      
      private var var_1334:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3112 = 0;
         this._root = param2;
         this.var_686 = param1;
         this.var_1330 = new WindowMouseDragger(param2);
         this.var_1333 = new WindowMouseScaler(param2);
         this.var_1329 = new WindowMouseListener(param2);
         this.var_1331 = new FocusManager(param2);
         this.var_1332 = new WindowToolTipAgent(param2);
         this.var_1334 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1330 != null)
         {
            this.var_1330.dispose();
            this.var_1330 = null;
         }
         if(this.var_1333 != null)
         {
            this.var_1333.dispose();
            this.var_1333 = null;
         }
         if(this.var_1329 != null)
         {
            this.var_1329.dispose();
            this.var_1329 = null;
         }
         if(this.var_1331 != null)
         {
            this.var_1331.dispose();
            this.var_1331 = null;
         }
         if(this.var_1332 != null)
         {
            this.var_1332.dispose();
            this.var_1332 = null;
         }
         if(this.var_1334 != null)
         {
            this.var_1334.dispose();
            this.var_1334 = null;
         }
         this._root = null;
         this.var_686 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1330;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1333;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1329;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1331;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1332;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1334;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
