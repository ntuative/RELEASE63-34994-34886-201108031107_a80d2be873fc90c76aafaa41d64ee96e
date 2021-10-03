package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1571:int;
      
      private var var_2884:int;
      
      private var var_747:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1571 = param1.readInteger();
         this.var_2884 = param1.readInteger();
         this.var_747 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_747.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get prizeLevelId() : int
      {
         return this.var_1571;
      }
      
      public function get probabilityDenominator() : int
      {
         return this.var_2884;
      }
      
      public function get prizes() : Array
      {
         return this.var_747;
      }
   }
}
