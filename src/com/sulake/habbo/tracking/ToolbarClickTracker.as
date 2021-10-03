package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1447:IHabboTracking;
      
      private var var_2133:Boolean = false;
      
      private var var_2438:int = 0;
      
      private var var_1815:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1447 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1447 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2133 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2438 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2133)
         {
            return;
         }
         ++this.var_1815;
         if(this.var_1815 <= this.var_2438)
         {
            this.var_1447.trackGoogle("toolbar",param1);
         }
      }
   }
}
