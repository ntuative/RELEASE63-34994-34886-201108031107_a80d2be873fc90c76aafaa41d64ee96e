package com.sulake.core.communication.messages
{
   public interface IMessageClassManager
   {
       
      
      function method_14(param1:IMessageConfiguration) : Boolean;
      
      function getMessageComposerID(param1:IMessageComposer) : int;
      
      function getMessageEventClasses(param1:int) : Array;
   }
}
