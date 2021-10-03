package com.sulake.core.assets
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BitmapDataAsset implements ILazyAsset
   {
      
      protected static var var_619:uint = 0;
      
      protected static var var_580:uint = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var var_118:Object;
      
      private var _bitmap:BitmapData;
      
      private var _offset:Point;
      
      private var var_1540:Boolean = false;
      
      private var var_1541:Boolean = false;
      
      private var var_1922:AssetTypeDeclaration;
      
      private var var_1158:String;
      
      public function BitmapDataAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         this._offset = new Point(0,0);
         super();
         this.var_1922 = param1;
         this.var_1158 = param2;
         ++var_619;
      }
      
      public static function get instances() : uint
      {
         return var_619;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_580;
      }
      
      public function get url() : String
      {
         return this.var_1158;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1540;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1541;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get content() : Object
      {
         if(!this._bitmap)
         {
            this.prepareLazyContent();
         }
         return this._bitmap;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1922;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            --var_619;
            if(this._bitmap)
            {
               try
               {
                  var_580 -= this._bitmap.width * this._bitmap.height * 4;
                  this._bitmap.dispose();
               }
               catch(e:Error)
               {
               }
            }
            this.var_118 = null;
            this._bitmap = null;
            this._offset = null;
            this.var_1922 = null;
            this.var_1158 = null;
            this._disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         this.var_118 = param1;
         this._bitmap = null;
      }
      
      public function prepareLazyContent() : void
      {
         var _loc1_:* = null;
         if(this.var_118 == null)
         {
            return;
         }
         if(this.var_118 is Class)
         {
            _loc1_ = new this.var_118() as Bitmap;
            if(_loc1_ != null)
            {
               this._bitmap = _loc1_.bitmapData.clone();
               _loc1_.bitmapData.dispose();
               if(this._bitmap != null)
               {
                  var_580 += this._bitmap.width * this._bitmap.height * 4;
                  this.var_118 = null;
                  return;
               }
               throw new Error("Failed to convert Bitmap Class to BitmapDataAsset!");
            }
            this._bitmap = new this.var_118() as BitmapData;
            if(this._bitmap != null)
            {
               this.var_118 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData Class to BitmapDataAsset!");
         }
         if(this.var_118 is Bitmap)
         {
            this._bitmap = Bitmap(this.var_118).bitmapData;
            if(this._bitmap == null)
            {
               throw new Error("Failed to convert Bitmap to BitmapDataAsset!");
            }
            this.var_118 = null;
         }
         if(this.var_118 is BitmapData)
         {
            this._bitmap = this.var_118 as BitmapData;
            if(this._bitmap != null)
            {
               this.var_118 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData to BitmapDataAsset!");
         }
         if(this.var_118 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(this.var_118)._bitmap;
            this._offset = BitmapDataAsset(this.var_118)._offset;
            this.var_1540 = BitmapDataAsset(this.var_118).var_1540;
            this.var_1541 = BitmapDataAsset(this.var_118).var_1541;
            if(this._bitmap != null)
            {
               this.var_118 = null;
               return;
            }
            throw new Error("Failed to read content from BitmaDataAsset!");
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(param1)._bitmap;
            this._offset = BitmapDataAsset(param1)._offset;
            return;
         }
         throw new Error("Provided asset should be of type BitmapDataAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            switch(_loc3_)
            {
               case "offset":
                  _loc5_ = _loc4_.split(",");
                  this._offset.x = parseInt(_loc5_[0]);
                  this._offset.y = parseInt(_loc5_[1]);
                  break;
               case "flipH":
                  this.var_1540 = _loc4_ == "1" || _loc4_ == "true";
                  break;
               case "flipV":
                  this.var_1541 = _loc4_ == "1" || _loc4_ == "true";
                  break;
            }
            _loc2_++;
         }
      }
   }
}
