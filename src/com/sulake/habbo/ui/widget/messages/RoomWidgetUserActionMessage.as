package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_594:String = "RWUAM_WHISPER_USER";
      
      public static const const_542:String = "RWUAM_IGNORE_USER";
      
      public static const const_518:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_439:String = "RWUAM_KICK_USER";
      
      public static const const_657:String = "RWUAM_BAN_USER";
      
      public static const const_563:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_614:String = "RWUAM_RESPECT_USER";
      
      public static const const_668:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_541:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_553:String = "RWUAM_START_TRADING";
      
      public static const const_750:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_647:String = "RWUAM_KICK_BOT";
      
      public static const const_652:String = "RWUAM_REPORT";
      
      public static const const_665:String = "RWUAM_PICKUP_PET";
      
      public static const const_1956:String = "RWUAM_TRAIN_PET";
      
      public static const const_613:String = " RWUAM_RESPECT_PET";
      
      public static const const_276:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_650:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
