package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_183:Number = 0;
      
      private var var_184:Number = 0;
      
      private var var_3014:Number = 0;
      
      private var var_3011:Number = 0;
      
      private var var_3015:Number = 0;
      
      private var var_3012:Number = 0;
      
      private var var_454:int = 0;
      
      private var var_2934:int = 0;
      
      private var var_360:Array;
      
      private var var_3013:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_360 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_183 = param3;
         this.var_184 = param4;
         this.var_3014 = param5;
         this.var_454 = param6;
         this.var_2934 = param7;
         this.var_3011 = param8;
         this.var_3015 = param9;
         this.var_3012 = param10;
         this.var_3013 = param11;
         this.var_360 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_183;
      }
      
      public function get z() : Number
      {
         return this.var_184;
      }
      
      public function get localZ() : Number
      {
         return this.var_3014;
      }
      
      public function get targetX() : Number
      {
         return this.var_3011;
      }
      
      public function get targetY() : Number
      {
         return this.var_3015;
      }
      
      public function get targetZ() : Number
      {
         return this.var_3012;
      }
      
      public function get dir() : int
      {
         return this.var_454;
      }
      
      public function get dirHead() : int
      {
         return this.var_2934;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_3013;
      }
      
      public function get actions() : Array
      {
         return this.var_360.slice();
      }
   }
}
