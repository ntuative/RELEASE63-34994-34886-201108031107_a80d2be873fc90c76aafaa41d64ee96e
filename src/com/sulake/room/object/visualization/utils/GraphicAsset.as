package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2691:String;
      
      private var var_2690:String;
      
      private var var_447:BitmapDataAsset;
      
      private var var_1540:Boolean;
      
      private var var_1541:Boolean;
      
      private var var_2692:Boolean;
      
      private var _offsetX:int;
      
      private var var_1201:int;
      
      private var var_223:int;
      
      private var _height:int;
      
      private var var_805:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2691 = param1;
         this.var_2690 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_447 = _loc9_;
            this.var_805 = false;
         }
         else
         {
            this.var_447 = null;
            this.var_805 = true;
         }
         this.var_1540 = param4;
         this.var_1541 = param5;
         this._offsetX = param6;
         this.var_1201 = param7;
         this.var_2692 = param8;
      }
      
      public function dispose() : void
      {
         this.var_447 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_805 && this.var_447 != null)
         {
            _loc1_ = this.var_447.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_223 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_805 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1541;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1540;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_223;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2691;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2690;
      }
      
      public function get asset() : IAsset
      {
         return this.var_447;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2692;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1540)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1541)
         {
            return this.var_1201;
         }
         return -(this.height + this.var_1201);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1201;
      }
   }
}
