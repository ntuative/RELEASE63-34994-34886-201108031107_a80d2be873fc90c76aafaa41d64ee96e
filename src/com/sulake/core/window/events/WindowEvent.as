package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1913:String = "WE_DESTROY";
      
      public static const const_339:String = "WE_DESTROYED";
      
      public static const const_1878:String = "WE_OPEN";
      
      public static const const_1825:String = "WE_OPENED";
      
      public static const const_1984:String = "WE_CLOSE";
      
      public static const const_2058:String = "WE_CLOSED";
      
      public static const const_2008:String = "WE_FOCUS";
      
      public static const const_332:String = "WE_FOCUSED";
      
      public static const const_2037:String = "WE_UNFOCUS";
      
      public static const const_1772:String = "WE_UNFOCUSED";
      
      public static const const_1972:String = "WE_ACTIVATE";
      
      public static const const_601:String = "WE_ACTIVATED";
      
      public static const const_1813:String = "WE_DEACTIVATE";
      
      public static const const_606:String = "WE_DEACTIVATED";
      
      public static const const_345:String = "WE_SELECT";
      
      public static const const_47:String = "WE_SELECTED";
      
      public static const const_584:String = "WE_UNSELECT";
      
      public static const const_494:String = "WE_UNSELECTED";
      
      public static const const_1826:String = "WE_LOCK";
      
      public static const const_1966:String = "WE_LOCKED";
      
      public static const const_2000:String = "WE_UNLOCK";
      
      public static const const_1922:String = "WE_UNLOCKED";
      
      public static const const_815:String = "WE_ENABLE";
      
      public static const const_209:String = "WE_ENABLED";
      
      public static const const_765:String = "WE_DISABLE";
      
      public static const const_205:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_447:String = "WE_RELOCATED";
      
      public static const const_1283:String = "WE_RESIZE";
      
      public static const const_41:String = "WE_RESIZED";
      
      public static const const_2016:String = "WE_MINIMIZE";
      
      public static const const_1992:String = "WE_MINIMIZED";
      
      public static const const_1857:String = "WE_MAXIMIZE";
      
      public static const const_1767:String = "WE_MAXIMIZED";
      
      public static const const_1989:String = "WE_RESTORE";
      
      public static const const_2052:String = "WE_RESTORED";
      
      public static const const_558:String = "WE_CHILD_ADDED";
      
      public static const const_452:String = "WE_CHILD_REMOVED";
      
      public static const const_204:String = "WE_CHILD_RELOCATED";
      
      public static const const_141:String = "WE_CHILD_RESIZED";
      
      public static const const_348:String = "WE_CHILD_ACTIVATED";
      
      public static const const_599:String = "WE_PARENT_ADDED";
      
      public static const const_1799:String = "WE_PARENT_REMOVED";
      
      public static const const_1914:String = "WE_PARENT_RELOCATED";
      
      public static const const_662:String = "WE_PARENT_RESIZED";
      
      public static const const_1284:String = "WE_PARENT_ACTIVATED";
      
      public static const const_178:String = "WE_OK";
      
      public static const const_537:String = "WE_CANCEL";
      
      public static const const_115:String = "WE_CHANGE";
      
      public static const const_622:String = "WE_SCROLL";
      
      public static const const_110:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_763:IWindow;
      
      protected var var_1159:Boolean;
      
      protected var var_514:Boolean;
      
      protected var var_168:Boolean;
      
      protected var var_764:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_763 = param3;
         _loc5_.var_514 = param4;
         _loc5_.var_168 = false;
         _loc5_.var_764 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_763;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_514;
      }
      
      public function recycle() : void
      {
         if(this.var_168)
         {
            throw new Error("Event already recycled!");
         }
         this.var_763 = null;
         this._window = null;
         this.var_168 = true;
         this.var_1159 = false;
         this.var_764.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1159;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1159 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1159;
      }
      
      public function stopPropagation() : void
      {
         this.var_1159 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1159 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_514 + " window: " + this._window + " }";
      }
   }
}
