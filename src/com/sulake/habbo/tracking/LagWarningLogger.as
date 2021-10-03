package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class LagWarningLogger
   {
       
      
      private var _connection:IConnection;
      
      private var var_2133:Boolean = false;
      
      private var var_2142:int;
      
      private var _lastWarning:int;
      
      private var var_1359:int;
      
      public function LagWarningLogger()
      {
         super();
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2133 = Boolean(int(param1.getKey("lagWarningLog.enabled","1")));
         this.var_2142 = int(param1.getKey("lagWarningLog.interval.seconds","10")) * 1000;
      }
      
      public function chatLagDetected(param1:int) : void
      {
         if(!this.var_2133 || this.var_2142 <= 0)
         {
            return;
         }
         ++this.var_1359;
         this.reportWarningsAsNeeded(param1);
      }
      
      public function update(param1:int) : void
      {
         this.reportWarningsAsNeeded(param1);
      }
      
      private function reportWarningsAsNeeded(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.var_1359 == 0 || this._connection == null)
         {
            return;
         }
         if(this._lastWarning == 0 || param1 - this._lastWarning > this.var_2142)
         {
            _loc2_ = new LagWarningReportMessageComposer(this.var_1359);
            this._connection.send(_loc2_);
            this._lastWarning = param1;
            this.var_1359 = 0;
         }
      }
   }
}
