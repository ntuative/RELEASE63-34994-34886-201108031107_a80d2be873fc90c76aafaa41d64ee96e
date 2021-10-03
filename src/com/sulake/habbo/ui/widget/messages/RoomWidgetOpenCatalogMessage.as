package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_814:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1239:String = "RWOCM_CLUB_MAIN";
      
      public static const const_2308:String = "RWOCM_PIXELS";
      
      public static const const_2309:String = "RWOCM_CREDITS";
      
      public static const const_2158:String = "RWOCM_SHELLS";
       
      
      private var var_2841:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_814);
         this.var_2841 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2841;
      }
   }
}
