package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModerateRoomMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_34:Array;
      
      public function ModerateRoomMessageComposer(param1:int, param2:Boolean, param3:Boolean, param4:Boolean)
      {
         this.var_34 = new Array();
         super();
         this.var_34.push(param1);
         this.var_34.push(!!param2 ? 1 : 0);
         this.var_34.push(!!param3 ? 1 : 0);
         this.var_34.push(!!param4 ? 1 : 0);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_34;
      }
      
      public function dispose() : void
      {
         this.var_34 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
