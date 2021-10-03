package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_2959:Boolean;
      
      private var var_2611:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         this.var_2959 = Boolean(parseInt(param1.@club));
         this.var_2611 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return this.var_2959;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2611;
      }
   }
}
