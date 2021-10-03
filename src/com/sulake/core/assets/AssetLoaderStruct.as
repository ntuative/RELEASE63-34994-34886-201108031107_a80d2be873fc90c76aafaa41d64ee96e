package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_1098:IAssetLoader;
      
      private var var_2691:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2691 = param1;
         this.var_1098 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2691;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_1098;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_1098 != null)
            {
               if(!this.var_1098.disposed)
               {
                  this.var_1098.dispose();
                  this.var_1098 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
