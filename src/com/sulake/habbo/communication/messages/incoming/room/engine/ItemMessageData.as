package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2720:Boolean = false;
      
      private var var_2719:int = 0;
      
      private var var_2721:int = 0;
      
      private var var_2622:int = 0;
      
      private var var_2623:int = 0;
      
      private var var_183:Number = 0;
      
      private var var_184:Number = 0;
      
      private var var_454:String = "";
      
      private var _type:int = 0;
      
      private var var_3136:String = "";
      
      private var var_1866:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_193:Boolean = false;
      
      private var var_2718:Boolean;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2720 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_193 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2720;
      }
      
      public function get wallX() : Number
      {
         return this.var_2719;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_2719 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2721;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_2721 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2622;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_2622 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2623;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_2623 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_183;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_183 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_184;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_193)
         {
            this.var_184 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_454;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_454 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_193)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_193)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_193)
         {
            this._data = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2718;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         if(!this.var_193)
         {
            this.var_2718 = param1;
         }
      }
   }
}
