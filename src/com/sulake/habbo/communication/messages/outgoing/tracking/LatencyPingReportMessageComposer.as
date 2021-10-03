package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2603:int;
      
      private var var_2605:int;
      
      private var var_2604:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2603 = param1;
         this.var_2605 = param2;
         this.var_2604 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2603,this.var_2605,this.var_2604];
      }
      
      public function dispose() : void
      {
      }
   }
}
