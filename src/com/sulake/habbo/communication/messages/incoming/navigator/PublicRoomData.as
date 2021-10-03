package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2871:String;
      
      private var var_2563:int;
      
      private var var_2394:int;
      
      private var var_2636:String;
      
      private var var_2957:int;
      
      private var var_1824:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2871 = param1.readString();
         this.var_2563 = param1.readInteger();
         this.var_2394 = param1.readInteger();
         this.var_2636 = param1.readString();
         this.var_2957 = param1.readInteger();
         this.var_1824 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2871;
      }
      
      public function get unitPort() : int
      {
         return this.var_2563;
      }
      
      public function get worldId() : int
      {
         return this.var_2394;
      }
      
      public function get castLibs() : String
      {
         return this.var_2636;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2957;
      }
      
      public function get nodeId() : int
      {
         return this.var_1824;
      }
   }
}
