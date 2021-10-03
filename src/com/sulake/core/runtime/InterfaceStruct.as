package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1487:IID;
      
      private var var_1801:String;
      
      private var var_118:IUnknown;
      
      private var var_779:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1487 = param1;
         this.var_1801 = getQualifiedClassName(this.var_1487);
         this.var_118 = param2;
         this.var_779 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1487;
      }
      
      public function get iis() : String
      {
         return this.var_1801;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_118;
      }
      
      public function get references() : uint
      {
         return this.var_779;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_118 == null;
      }
      
      public function dispose() : void
      {
         this.var_1487 = null;
         this.var_1801 = null;
         this.var_118 = null;
         this.var_779 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_779;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_779) : uint(0);
      }
   }
}
