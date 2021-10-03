package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_826;
         param1["badge"] = const_893;
         param1["bitmap"] = const_428;
         param1["border"] = const_890;
         param1["border_notify"] = const_1807;
         param1["bubble"] = const_1012;
         param1["bubble_pointer_up"] = const_1344;
         param1["bubble_pointer_right"] = const_1192;
         param1["bubble_pointer_down"] = const_1337;
         param1["bubble_pointer_left"] = const_1205;
         param1["button"] = const_669;
         param1["button_thick"] = const_842;
         param1["button_icon"] = const_1776;
         param1["button_group_left"] = const_800;
         param1["button_group_center"] = const_961;
         param1["button_group_right"] = const_837;
         param1["canvas"] = const_908;
         param1["checkbox"] = const_925;
         param1["closebutton"] = const_1178;
         param1["container"] = const_435;
         param1["container_button"] = const_771;
         param1["display_object_wrapper"] = const_895;
         param1["dropmenu"] = const_545;
         param1["dropmenu_item"] = const_610;
         param1["frame"] = const_432;
         param1["frame_notify"] = const_1968;
         param1["header"] = const_914;
         param1["html"] = const_1281;
         param1["icon"] = const_1357;
         param1["itemgrid"] = const_1199;
         param1["itemgrid_horizontal"] = const_616;
         param1["itemgrid_vertical"] = const_850;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_438;
         param1["itemlist_vertical"] = const_410;
         param1["label"] = const_1031;
         param1["maximizebox"] = const_1839;
         param1["menu"] = const_1842;
         param1["menu_item"] = const_1998;
         param1["submenu"] = const_1419;
         param1["minimizebox"] = const_1756;
         param1["notify"] = const_1868;
         param1["null"] = const_867;
         param1["password"] = const_899;
         param1["radiobutton"] = const_823;
         param1["region"] = const_333;
         param1["restorebox"] = const_1939;
         param1["scaler"] = const_651;
         param1["scaler_horizontal"] = const_1993;
         param1["scaler_vertical"] = const_1950;
         param1["scrollbar_horizontal"] = const_546;
         param1["scrollbar_vertical"] = const_1028;
         param1["scrollbar_slider_button_up"] = const_1222;
         param1["scrollbar_slider_button_down"] = const_1371;
         param1["scrollbar_slider_button_left"] = const_1279;
         param1["scrollbar_slider_button_right"] = const_1288;
         param1["scrollbar_slider_bar_horizontal"] = const_1366;
         param1["scrollbar_slider_bar_vertical"] = const_1373;
         param1["scrollbar_slider_track_horizontal"] = const_1414;
         param1["scrollbar_slider_track_vertical"] = const_1412;
         param1["scrollable_itemlist"] = const_1790;
         param1["scrollable_itemlist_vertical"] = const_635;
         param1["scrollable_itemlist_horizontal"] = const_1240;
         param1["selector"] = const_743;
         param1["selector_list"] = const_1005;
         param1["submenu"] = const_1419;
         param1["tab_button"] = const_863;
         param1["tab_container_button"] = const_1380;
         param1["tab_context"] = const_424;
         param1["tab_content"] = const_1420;
         param1["tab_selector"] = const_819;
         param1["text"] = const_754;
         param1["input"] = const_1014;
         param1["toolbar"] = const_1759;
         param1["tooltip"] = const_446;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
