package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class EventStreamData
   {
      
      public static const const_739:uint = 0;
      
      public static const const_1298:uint = 1;
      
      public static const const_878:uint = 2;
      
      public static const const_1389:uint = 3;
      
      public static const const_1967:uint = 3;
      
      public static const const_2033:int = 0;
      
      public static const const_1367:int = 1;
      
      public static const const_1999:int = 2;
      
      public static const const_1766:int = 3;
      
      public static const LINK_TARGET_OPEN_MOTTO_CHANGER:int = 4;
      
      public static const const_1763:int = 5;
       
      
      private var _id:int;
      
      private var var_2785:int;
      
      private var var_2787:String;
      
      private var var_2783:String;
      
      private var var_2786:String;
      
      private var var_2134:String;
      
      private var var_2782:int;
      
      private var var_2788:int;
      
      private var var_2784:Object;
      
      public function EventStreamData(param1:int, param2:int, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:IMessageDataWrapper)
      {
         super();
         this._id = param1;
         this.var_2785 = param2;
         this.var_2787 = param3;
         this.var_2783 = param4;
         this.var_2786 = param5;
         this.var_2134 = param6;
         this.var_2782 = param7;
         this.var_2788 = param8;
         this.var_2784 = parse(param2,param9);
      }
      
      protected static function parse(param1:int, param2:IMessageDataWrapper) : Object
      {
         var _loc3_:Object = new Object();
         switch(param1)
         {
            case const_739:
               _loc3_.friendId = param2.readString();
               _loc3_.friendName = param2.readString();
               break;
            case const_1298:
               _loc3_.roomId = param2.readString();
               _loc3_.roomName = param2.readString();
               break;
            case const_878:
               _loc3_.achievementCode = param2.readString();
               break;
            case const_1389:
               _loc3_.motto = param2.readString();
         }
         return _loc3_;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get actionId() : int
      {
         return this.var_2785;
      }
      
      public function get accountId() : String
      {
         return this.var_2787;
      }
      
      public function get accountName() : String
      {
         return this.var_2783;
      }
      
      public function get imageFilePath() : String
      {
         return this.var_2134;
      }
      
      public function get minutesSinceEvent() : int
      {
         return this.var_2782;
      }
      
      public function get linkTargetType() : int
      {
         return this.var_2788;
      }
      
      public function get extraDataStruct() : Object
      {
         return this.var_2784;
      }
      
      public function get accountGender() : String
      {
         return this.var_2786;
      }
   }
}

class Struct
{
    
   
   function Struct()
   {
      super();
   }
}

class FriendMadeStruct extends Struct
{
    
   
   public var friendId:String;
   
   public var friendName:String;
   
   function FriendMadeStruct(param1:String, param2:String)
   {
      super();
      this.friendId = param1;
      this.friendName = param2;
   }
}

class RoomLikedStruct extends Struct
{
    
   
   public var roomId:String;
   
   public var roomName:String;
   
   function RoomLikedStruct(param1:String, param2:String)
   {
      super();
      this.roomId = param1;
      this.roomName = param2;
   }
}

class AchievementEarnedStruct extends Struct
{
    
   
   public var achievementCode:String;
   
   function AchievementEarnedStruct(param1:String)
   {
      super();
      this.achievementCode = param1;
   }
}
