package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_884:TileHeightMap = null;
      
      private var var_1357:LegacyWallGeometry = null;
      
      private var var_1356:RoomCamera = null;
      
      private var var_885:SelectedRoomObjectData = null;
      
      private var var_883:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_597:Map;
      
      private var var_598:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_597 = new Map();
         this.var_598 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1357 = new LegacyWallGeometry();
         this.var_1356 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_884;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_884 != null)
         {
            this.var_884.dispose();
         }
         this.var_884 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1357;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1356;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_885;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_885 != null)
         {
            this.var_885.dispose();
         }
         this.var_885 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_883;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_883 != null)
         {
            this.var_883.dispose();
         }
         this.var_883 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_884 != null)
         {
            this.var_884.dispose();
            this.var_884 = null;
         }
         if(this.var_1357 != null)
         {
            this.var_1357.dispose();
            this.var_1357 = null;
         }
         if(this.var_1356 != null)
         {
            this.var_1356.dispose();
            this.var_1356 = null;
         }
         if(this.var_885 != null)
         {
            this.var_885.dispose();
            this.var_885 = null;
         }
         if(this.var_883 != null)
         {
            this.var_883.dispose();
            this.var_883 = null;
         }
         if(this.var_597 != null)
         {
            this.var_597.dispose();
            this.var_597 = null;
         }
         if(this.var_598 != null)
         {
            this.var_598.dispose();
            this.var_598 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_597.remove(param1.id);
            this.var_597.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_597.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_597.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_597.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_598.remove(param1.id);
            this.var_598.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_598.length > 0)
         {
            return this.getWallItemDataWithId(this.var_598.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_598.remove(param1);
      }
   }
}
