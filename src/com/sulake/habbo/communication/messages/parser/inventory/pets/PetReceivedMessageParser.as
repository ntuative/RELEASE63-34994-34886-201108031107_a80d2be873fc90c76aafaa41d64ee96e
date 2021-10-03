package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1905:Boolean;
      
      private var var_988:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1905 = param1.readBoolean();
         this.var_988 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1905 + ", " + this.var_988.id + ", " + this.var_988.name + ", " + this.var_988.type + ", " + this.var_988.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1905;
      }
      
      public function get pet() : PetData
      {
         return this.var_988;
      }
   }
}
