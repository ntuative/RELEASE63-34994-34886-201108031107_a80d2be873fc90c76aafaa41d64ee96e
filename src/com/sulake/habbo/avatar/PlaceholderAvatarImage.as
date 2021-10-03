package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_773:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1155)
         {
            _structure = null;
            _assets = null;
            var_273 = null;
            var_311 = null;
            var_754 = null;
            var_610 = null;
            var_360 = null;
            if(!var_1424 && var_48)
            {
               var_48.dispose();
            }
            var_48 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_836 = null;
            var_1155 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_773[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_773[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_453:
               switch(_loc3_)
               {
                  case AvatarAction.const_1026:
                  case AvatarAction.const_655:
                  case AvatarAction.const_450:
                  case AvatarAction.const_784:
                  case AvatarAction.const_401:
                  case AvatarAction.const_812:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_354:
            case AvatarAction.const_156:
            case AvatarAction.const_275:
            case AvatarAction.const_849:
            case AvatarAction.const_1018:
            case AvatarAction.const_780:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
