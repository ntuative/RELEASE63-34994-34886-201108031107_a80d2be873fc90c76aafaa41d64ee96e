package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.Direction;
   import com.sulake.core.window.enum.LinkTarget;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   
   public class PropertyDefaults
   {
      
      public static const const_931:String = "antialias_type";
      
      public static const const_781:String = "auto_arrange_items";
      
      public static const const_1033:String = "auto_size";
      
      public static const const_990:String = "bitmap_asset_name";
      
      public static const const_802:String = "direction";
      
      public static const const_1427:String = "display_as_password";
      
      public static const const_764:String = "editable";
      
      public static const const_983:String = "focus_capturer";
      
      public static const const_1187:String = "grid_fit_type";
      
      public static const const_862:String = "handle_bitmap_disposing";
      
      public static const const_975:String = "link_target";
      
      public static const const_419:String = "spacing";
      
      public static const const_273:String = "margin_left";
      
      public static const const_278:String = "margin_top";
      
      public static const const_295:String = "margin_right";
      
      public static const const_296:String = "margin_bottom";
      
      public static const const_997:String = "item_array";
      
      public static const const_776:String = "mouse_wheel_enabled";
      
      public static const const_861:String = "pointer_offset";
      
      public static const const_806:String = "resize_on_item_update";
      
      public static const const_824:String = "scale_to_fit_items";
      
      public static const const_735:String = "scroll_step_h";
      
      public static const const_1001:String = "scroll_step_v";
      
      public static const const_748:String = "selectable";
      
      public static const const_421:String = "text_color";
      
      public static const const_412:String = "text_style";
      
      public static const const_919:String = "tool_tip_caption";
      
      public static const const_865:String = "tool_tip_delay";
      
      public static const const_2275:String = "test_id_key";
      
      public static const const_1923:String = AntiAliasType.NORMAL;
      
      public static const const_1332:Array = [AntiAliasType.NORMAL,AntiAliasType.ADVANCED];
      
      public static const const_1256:Boolean = true;
      
      public static const const_1228:String = TextFieldAutoSize.NONE;
      
      public static const const_1183:Array = [TextFieldAutoSize.NONE,TextFieldAutoSize.LEFT,TextFieldAutoSize.CENTER,TextFieldAutoSize.RIGHT];
      
      public static const const_1352:String = null;
      
      public static const const_2062:String = Direction.DOWN;
      
      public static const const_1844:Array = [Direction.UP,Direction.DOWN,Direction.LEFT,Direction.RIGHT];
      
      public static const const_1204:Boolean = false;
      
      public static const const_1941:Boolean = true;
      
      public static const const_1323:Boolean = false;
      
      public static const const_1423:String = GridFitType.PIXEL;
      
      public static const const_1216:Array = [GridFitType.PIXEL,GridFitType.NONE,GridFitType.SUBPIXEL];
      
      public static const const_1249:Boolean = true;
      
      public static const HTML_LINK_TARGET_VALUE:String = LinkTarget.const_30;
      
      public static const const_742:Array = [LinkTarget.const_30,LinkTarget.name_3,LinkTarget.const_2053,LinkTarget.const_1859,LinkTarget.const_1990,LinkTarget.const_1255];
      
      public static const const_988:int = 0;
      
      public static const const_794:int = 0;
      
      public static const const_871:int = 0;
      
      public static const const_920:int = 0;
      
      public static const const_787:int = 0;
      
      public static const const_1795:Array = [];
      
      public static const const_1310:Boolean = true;
      
      public static const const_1863:int = 0;
      
      public static const const_1354:Boolean = false;
      
      public static const const_1358:Boolean = false;
      
      public static const const_1333:Number = -1;
      
      public static const const_1411:Number = -1;
      
      public static const const_1351:Boolean = true;
      
      public static const const_1011:uint = 0;
      
      public static const const_1926:String = TextStyleManager.const_212;
      
      public static const const_1015:Array = TextStyleManager.getStyleNameArrayRef();
      
      public static const const_608:String = "";
      
      public static const const_1410:int = 500;
      
      public static const const_2268:PropertyStruct = new PropertyStruct(const_931,const_1923,PropertyStruct.const_52,false,const_1332);
      
      public static const const_2012:PropertyStruct = new PropertyStruct(const_781,const_1256,PropertyStruct.const_39,false);
      
      public static const const_1974:PropertyStruct = new PropertyStruct(const_1033,const_1228,PropertyStruct.const_52,false,const_1183);
      
      public static const const_1867:PropertyStruct = new PropertyStruct(const_990,const_1352,PropertyStruct.const_52,false);
      
      public static const const_1875:PropertyStruct = new PropertyStruct(const_802,const_2062,PropertyStruct.const_52,false,const_1844);
      
      public static const const_1817:PropertyStruct = new PropertyStruct(const_1427,const_1204,PropertyStruct.const_39,false);
      
      public static const const_1949:PropertyStruct = new PropertyStruct(const_764,const_1941,PropertyStruct.const_39,false);
      
      public static const const_2066:PropertyStruct = new PropertyStruct(const_983,const_1323,PropertyStruct.const_39,false);
      
      public static const const_1805:PropertyStruct = new PropertyStruct(const_1187,const_1423,PropertyStruct.const_52,false,const_1216);
      
      public static const const_2029:PropertyStruct = new PropertyStruct(const_862,const_1249,PropertyStruct.const_39,false);
      
      public static const const_1786:PropertyStruct = new PropertyStruct(const_975,HTML_LINK_TARGET_VALUE,PropertyStruct.const_52,false,const_742);
      
      public static const const_1392:PropertyStruct = new PropertyStruct(const_419,const_988,PropertyStruct.const_35,false);
      
      public static const const_813:PropertyStruct = new PropertyStruct(const_273,const_794,PropertyStruct.const_35,false);
      
      public static const const_1020:PropertyStruct = new PropertyStruct(const_278,const_871,PropertyStruct.const_35,false);
      
      public static const const_969:PropertyStruct = new PropertyStruct(const_295,const_920,PropertyStruct.const_35,false);
      
      public static const const_874:PropertyStruct = new PropertyStruct(const_296,const_787,PropertyStruct.const_35,false);
      
      public static const const_1911:PropertyStruct = new PropertyStruct(const_997,const_1795,PropertyStruct.const_166,false);
      
      public static const const_1858:PropertyStruct = new PropertyStruct(const_776,const_1310,PropertyStruct.const_39,false);
      
      public static const const_2064:PropertyStruct = new PropertyStruct(const_806,const_1354,PropertyStruct.const_39,false);
      
      public static const const_1798:PropertyStruct = new PropertyStruct(const_861,const_1863,PropertyStruct.const_35,false);
      
      public static const const_1977:PropertyStruct = new PropertyStruct(const_824,const_1358,PropertyStruct.const_39,false);
      
      public static const const_1938:PropertyStruct = new PropertyStruct(const_735,const_1333,PropertyStruct.const_128,false);
      
      public static const const_1784:PropertyStruct = new PropertyStruct(const_1001,const_1411,PropertyStruct.const_128,false);
      
      public static const const_2005:PropertyStruct = new PropertyStruct(const_748,const_1351,PropertyStruct.const_39,false);
      
      public static const const_1219:PropertyStruct = new PropertyStruct(const_421,const_1011,PropertyStruct.const_152,false);
      
      public static const const_1202:PropertyStruct = new PropertyStruct(const_412,const_1926,PropertyStruct.const_52,false,const_1015);
      
      public static const const_2051:PropertyStruct = new PropertyStruct(const_919,const_608,PropertyStruct.const_52,false);
      
      public static const TOOL_TIP_DELAY:PropertyStruct = new PropertyStruct(const_865,const_1410,PropertyStruct.const_271,false);
       
      
      public function PropertyDefaults()
      {
         super();
      }
   }
}
