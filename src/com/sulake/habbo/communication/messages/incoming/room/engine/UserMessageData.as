package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1191:String = "M";
      
      public static const const_2007:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_183:Number = 0;
      
      private var var_184:Number = 0;
      
      private var var_454:int = 0;
      
      private var _name:String = "";
      
      private var var_1729:int = 0;
      
      private var var_1020:String = "";
      
      private var var_754:String = "";
      
      private var var_2320:String = "";
      
      private var var_2315:int;
      
      private var var_2317:int = 0;
      
      private var var_2319:String = "";
      
      private var var_2318:int = 0;
      
      private var var_2314:int = 0;
      
      private var var_2316:String = "";
      
      private var var_193:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_193 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_193)
         {
            this._x = param1;
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
      
      public function get dir() : int
      {
         return this.var_454;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_454 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_193)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1729;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_1729 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1020;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_1020 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_754 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2320;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2320 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2315;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2315 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2317;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2317 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2319;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2319 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2318;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2318 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2314;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_193)
         {
            this.var_2314 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2316;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_193)
         {
            this.var_2316 = param1;
         }
      }
   }
}
