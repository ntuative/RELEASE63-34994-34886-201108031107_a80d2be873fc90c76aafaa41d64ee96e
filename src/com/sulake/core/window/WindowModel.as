package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var var_10:Rectangle;
      
      protected var var_434:Rectangle;
      
      protected var var_68:Rectangle;
      
      protected var var_166:Rectangle;
      
      protected var var_167:Rectangle;
      
      protected var _context:WindowContext;
      
      protected var var_519:Boolean = false;
      
      protected var var_267:uint = 16777215;
      
      protected var var_618:uint;
      
      protected var var_518:uint = 10;
      
      protected var var_765:Boolean = true;
      
      protected var var_340:Boolean = true;
      
      protected var var_778:Number = 1.0;
      
      protected var var_20:uint;
      
      protected var _state:uint;
      
      protected var var_91:uint;
      
      protected var _type:uint;
      
      protected var var_18:String = "";
      
      protected var _name:String;
      
      protected var _id:uint;
      
      protected var var_954:Array;
      
      protected var _disposed:Boolean = false;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._type = param3;
         this.var_20 = param5;
         this._state = WindowState.const_101;
         this.var_91 = param4;
         this.var_954 = param8 == null ? [] : param8;
         this._context = param6;
         this.var_10 = param7.clone();
         this.var_434 = param7.clone();
         this.var_68 = param7.clone();
         this.var_166 = new Rectangle();
         this.var_167 = null;
      }
      
      public function get x() : int
      {
         return this.var_10.x;
      }
      
      public function get y() : int
      {
         return this.var_10.y;
      }
      
      public function get width() : int
      {
         return this.var_10.width;
      }
      
      public function get height() : int
      {
         return this.var_10.height;
      }
      
      public function get position() : Point
      {
         return this.var_10.topLeft;
      }
      
      public function get rectangle() : Rectangle
      {
         return this.var_10;
      }
      
      public function get context() : IWindowContext
      {
         return this._context;
      }
      
      public function get mouseThreshold() : uint
      {
         return this.var_518;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get background() : Boolean
      {
         return this.var_519;
      }
      
      public function get clipping() : Boolean
      {
         return this.var_765;
      }
      
      public function get visible() : Boolean
      {
         return this.var_340;
      }
      
      public function get color() : uint
      {
         return this.var_267;
      }
      
      public function get alpha() : uint
      {
         return this.var_618 >>> 24;
      }
      
      public function get blend() : Number
      {
         return this.var_778;
      }
      
      public function get param() : uint
      {
         return this.var_20;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get style() : uint
      {
         return this.var_91;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get caption() : String
      {
         return this.var_18;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get tags() : Array
      {
         return this.var_954;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_10 = null;
            this._context = null;
            this._state = WindowState.const_547;
            this.var_954 = null;
         }
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function getInitialWidth() : int
      {
         return this.var_434.width;
      }
      
      public function getInitialHeight() : int
      {
         return this.var_434.height;
      }
      
      public function getPreviousWidth() : int
      {
         return this.var_68.width;
      }
      
      public function getPreviousHeight() : int
      {
         return this.var_68.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return this.var_166.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return this.var_166.height;
      }
      
      public function getMaximizedWidth() : int
      {
         return this.var_167.width;
      }
      
      public function method_18() : int
      {
         return this.var_167.height;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._type & param2 ^ param1) == 0;
         }
         return (this._type & param1) == param1;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._state & param2 ^ param1) == 0;
         }
         return (this._state & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_91 & param2 ^ param1) == 0;
         }
         return (this.var_91 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_20 & param2 ^ param1) == 0;
         }
         return (this.var_20 & param1) == param1;
      }
   }
}
