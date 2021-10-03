package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1698:int;
      
      private var var_2194:Number;
      
      private var var_3033:Number;
      
      private var var_3030:int;
      
      private var var_3032:Number;
      
      private var var_3031:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1698 = param1;
         this.var_2194 = param2;
         this.var_3033 = param3;
         this.var_3032 = param4;
         this.var_3031 = param5;
         this.var_3030 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1698;
      }
      
      public function get startPos() : Number
      {
         if(this.var_2194 < 0)
         {
            return 0;
         }
         return this.var_2194 + (getTimer() - this.var_3030) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_3033;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_3032;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_3031;
      }
   }
}
