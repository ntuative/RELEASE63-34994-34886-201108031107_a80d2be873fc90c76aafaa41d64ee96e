package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2235:int = 16777215;
      
      public static const const_1403:int = 8191;
      
      public static const const_1261:int = 8191;
      
      public static const const_2318:int = 1;
      
      public static const const_1263:int = 1;
      
      public static const const_1189:int = 1;
      
      private static var var_581:uint = 0;
      
      private static var var_580:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1403)
         {
            param2 = const_1403;
         }
         else if(param2 < const_1263)
         {
            param2 = const_1263;
         }
         if(param3 > const_1261)
         {
            param3 = const_1261;
         }
         else if(param3 < const_1189)
         {
            param3 = const_1189;
         }
         super(param2,param3,param4,param5);
         ++var_581;
         var_580 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_581;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_580;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_580 -= width * height * 4;
            --var_581;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
