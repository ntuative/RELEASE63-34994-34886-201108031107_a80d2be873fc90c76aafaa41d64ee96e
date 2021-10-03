package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const const_618:String = "ROFCAE_DICE_OFF";
      
      public static const const_527:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const const_585:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const const_577:String = "ROFCAE_STICKIE";
      
      public static const const_520:String = "ROFCAE_VIRAL_GIFT";
      
      public static const const_506:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_586:String = "ROFCAE_QUEST_VENDING";
      
      public static const const_643:String = "ROFCAE_SOUND_MACHINE_INIT";
      
      public static const const_621:String = "ROFCAE_SOUND_MACHINE_START";
      
      public static const const_664:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_562:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
      
      public static const const_620:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_567:String = "ROFCAE_JUKEBOX_START";
      
      public static const const_557:String = "ROFCAE_JUKEBOX_MACHINE_STOP";
      
      public static const const_517:String = "ROFCAE_JUKEBOX_DISPOSE";
      
      public static const const_287:String = "ROFCAE_MOUSE_BUTTON";
      
      public static const const_346:String = "ROFCAE_MOUSE_ARROW";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
