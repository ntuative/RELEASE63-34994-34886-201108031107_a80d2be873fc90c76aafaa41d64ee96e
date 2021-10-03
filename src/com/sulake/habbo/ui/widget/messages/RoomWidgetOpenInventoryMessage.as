package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_977:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1830:String = "inventory_effects";
      
      public static const const_1382:String = "inventory_badges";
      
      public static const const_1882:String = "inventory_clothes";
      
      public static const const_1963:String = "inventory_furniture";
       
      
      private var var_2602:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_977);
         this.var_2602 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2602;
      }
   }
}
