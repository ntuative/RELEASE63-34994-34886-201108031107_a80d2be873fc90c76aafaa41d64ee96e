package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1301:int = 0;
       
      
      private var var_447:BitmapData = null;
      
      private var var_2691:String = "";
      
      private var var_340:Boolean = true;
      
      private var var_2518:String = "";
      
      private var var_2767:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_2078:String;
      
      private var var_1540:Boolean = false;
      
      private var var_1541:Boolean = false;
      
      private var _offset:Point;
      
      private var var_223:int = 0;
      
      private var _height:int = 0;
      
      private var var_1218:Number = 0;
      
      private var var_2831:Boolean = false;
      
      private var var_2859:Boolean = true;
      
      private var var_2832:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2696:int = 0;
      
      private var var_2860:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_2078 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2696 = var_1301++;
      }
      
      public function dispose() : void
      {
         this.var_447 = null;
         this.var_223 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_447;
      }
      
      public function get assetName() : String
      {
         return this.var_2691;
      }
      
      public function get visible() : Boolean
      {
         return this.var_340;
      }
      
      public function get tag() : String
      {
         return this.var_2518;
      }
      
      public function get alpha() : int
      {
         return this.var_2767;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_2078;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1541;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1540;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_223;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1218;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2831;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2859;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2832;
      }
      
      public function get instanceId() : int
      {
         return this.var_2696;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2860;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_223 = param1.width;
            this._height = param1.height;
         }
         this.var_447 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2691 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_340 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2518 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2767 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2078 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2860 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1540 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1541 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1218 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2831 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2859 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2832 = param1;
         ++this._updateID;
      }
   }
}
