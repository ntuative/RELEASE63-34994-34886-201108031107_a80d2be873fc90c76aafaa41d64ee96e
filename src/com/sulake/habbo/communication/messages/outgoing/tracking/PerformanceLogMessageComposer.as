package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2305:int = 0;
      
      private var var_1503:String = "";
      
      private var var_1827:String = "";
      
      private var var_2415:String = "";
      
      private var var_2414:String = "";
      
      private var var_1806:int = 0;
      
      private var var_2416:int = 0;
      
      private var var_2413:int = 0;
      
      private var var_1502:int = 0;
      
      private var var_2417:int = 0;
      
      private var var_1501:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2305 = param1;
         this.var_1503 = param2;
         this.var_1827 = param3;
         this.var_2415 = param4;
         this.var_2414 = param5;
         if(param6)
         {
            this.var_1806 = 1;
         }
         else
         {
            this.var_1806 = 0;
         }
         this.var_2416 = param7;
         this.var_2413 = param8;
         this.var_1502 = param9;
         this.var_2417 = param10;
         this.var_1501 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2305,this.var_1503,this.var_1827,this.var_2415,this.var_2414,this.var_1806,this.var_2416,this.var_2413,this.var_1502,this.var_2417,this.var_1501];
      }
   }
}
