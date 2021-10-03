package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3128:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_94 = param1.desktop;
         var_71 = param1.var_1422 as WindowController;
         var_144 = param1.var_1420 as WindowController;
         var_185 = param1.renderer;
         var_948 = param1.var_1423;
         param2.begin();
         param2.end();
         param1.desktop = var_94;
         param1.var_1422 = var_71;
         param1.var_1420 = var_144;
         param1.renderer = var_185;
         param1.var_1423 = var_948;
      }
   }
}
