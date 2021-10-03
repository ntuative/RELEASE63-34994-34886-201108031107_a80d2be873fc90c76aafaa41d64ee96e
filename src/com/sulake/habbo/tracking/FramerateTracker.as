package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1826:int;
      
      private var var_2978:int;
      
      private var var_866:int;
      
      private var var_534:Number;
      
      private var var_2977:Boolean;
      
      private var var_2979:int;
      
      private var var_2151:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_534);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2978 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2979 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2977 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_866;
         if(this.var_866 == 1)
         {
            this.var_534 = param1;
            this.var_1826 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_866);
            this.var_534 = this.var_534 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2977 && param3 - this.var_1826 >= this.var_2978)
         {
            this.var_866 = 0;
            if(this.var_2151 < this.var_2979)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_2151;
               this.var_1826 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
