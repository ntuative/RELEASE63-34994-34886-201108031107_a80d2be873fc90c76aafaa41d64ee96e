package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2077:IID;
      
      private var var_1155:Boolean;
      
      private var var_1323:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2077 = param1;
         this.var_1323 = new Array();
         this.var_1155 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2077;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1155;
      }
      
      public function get receivers() : Array
      {
         return this.var_1323;
      }
      
      public function dispose() : void
      {
         if(!this.var_1155)
         {
            this.var_1155 = true;
            this.var_2077 = null;
            while(this.var_1323.length > 0)
            {
               this.var_1323.pop();
            }
            this.var_1323 = null;
         }
      }
   }
}
