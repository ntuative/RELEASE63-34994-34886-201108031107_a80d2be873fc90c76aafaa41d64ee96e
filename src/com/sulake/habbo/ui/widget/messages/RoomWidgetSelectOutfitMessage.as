package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1208:String = "select_outfit";
       
      
      private var var_2418:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1208);
         this.var_2418 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_2418;
      }
   }
}
