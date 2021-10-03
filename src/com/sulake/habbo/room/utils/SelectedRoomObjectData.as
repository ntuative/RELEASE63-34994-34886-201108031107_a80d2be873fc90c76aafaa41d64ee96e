package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var var_2861:String = "";
      
      private var var_102:Vector3d = null;
      
      private var var_454:Vector3d = null;
      
      private var var_2402:int = 0;
      
      private var var_2862:String = null;
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         this._id = param1;
         this._category = param2;
         this.var_2861 = param3;
         this.var_102 = new Vector3d();
         this.var_102.assign(param4);
         this.var_454 = new Vector3d();
         this.var_454.assign(param5);
         this.var_2402 = param6;
         this.var_2862 = param7;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get operation() : String
      {
         return this.var_2861;
      }
      
      public function get loc() : Vector3d
      {
         return this.var_102;
      }
      
      public function get dir() : Vector3d
      {
         return this.var_454;
      }
      
      public function get typeId() : int
      {
         return this.var_2402;
      }
      
      public function get instanceData() : String
      {
         return this.var_2862;
      }
      
      public function dispose() : void
      {
         this.var_102 = null;
         this.var_454 = null;
      }
   }
}
