package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1361:int;
      
      private var var_2742:Boolean;
      
      private var var_2611:Boolean;
      
      private var var_2743:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1361 = param1.readInteger();
         this.var_2742 = param1.readBoolean();
         this.var_2743 = param1.readInteger();
         this.var_2611 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1361;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2742;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2611;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2743;
      }
   }
}
