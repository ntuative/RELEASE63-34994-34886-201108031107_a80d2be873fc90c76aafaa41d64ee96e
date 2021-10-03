package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2358:String;
      
      private var var_351:String;
      
      public function WelcomeNotification(param1:String, param2:String)
      {
         super();
         this.var_2358 = param1;
         this.var_351 = param2;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2358;
      }
      
      public function get localizationKey() : String
      {
         return this.var_351;
      }
   }
}
