package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_195;
         param1["bound_to_parent_rect"] = const_103;
         param1["child_window"] = const_1416;
         param1["embedded_controller"] = const_1299;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_29;
         param1["internal_event_handling"] = const_954;
         param1["mouse_dragging_target"] = const_302;
         param1["mouse_dragging_trigger"] = const_441;
         param1["mouse_scaling_target"] = const_382;
         param1["mouse_scaling_trigger"] = const_583;
         param1["horizontal_mouse_scaling_trigger"] = const_283;
         param1["vertical_mouse_scaling_trigger"] = const_308;
         param1["observe_parent_input_events"] = const_1342;
         param1["optimize_region_to_layout_size"] = const_500;
         param1["parent_window"] = const_1391;
         param1["relative_horizontal_scale_center"] = const_231;
         param1["relative_horizontal_scale_fixed"] = const_174;
         param1["relative_horizontal_scale_move"] = const_349;
         param1["relative_horizontal_scale_strech"] = const_414;
         param1["relative_scale_center"] = const_1329;
         param1["relative_scale_fixed"] = const_915;
         param1["relative_scale_move"] = const_1345;
         param1["relative_scale_strech"] = const_1238;
         param1["relative_vertical_scale_center"] = const_219;
         param1["relative_vertical_scale_fixed"] = const_163;
         param1["relative_vertical_scale_move"] = const_291;
         param1["relative_vertical_scale_strech"] = const_247;
         param1["on_resize_align_left"] = const_960;
         param1["on_resize_align_right"] = const_510;
         param1["on_resize_align_center"] = const_615;
         param1["on_resize_align_top"] = const_993;
         param1["on_resize_align_bottom"] = const_521;
         param1["on_resize_align_middle"] = const_587;
         param1["on_accommodate_align_left"] = const_1297;
         param1["on_accommodate_align_right"] = const_514;
         param1["on_accommodate_align_center"] = const_835;
         param1["on_accommodate_align_top"] = const_1221;
         param1["on_accommodate_align_bottom"] = const_564;
         param1["on_accommodate_align_middle"] = const_967;
         param1["route_input_events_to_parent"] = const_522;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1328;
         param1["scalable_with_mouse"] = const_1305;
         param1["reflect_horizontal_resize_to_parent"] = const_556;
         param1["reflect_vertical_resize_to_parent"] = const_576;
         param1["reflect_resize_to_parent"] = const_338;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1253;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
