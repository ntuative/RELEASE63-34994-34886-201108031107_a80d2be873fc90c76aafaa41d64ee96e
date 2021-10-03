package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2914:String;
      
      private var var_2116:String;
      
      private var var_2913:String;
      
      private var var_2114:Boolean;
      
      private var var_2115:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2914 = String(param1["set-type"]);
         this.var_2116 = String(param1["flipped-set-type"]);
         this.var_2913 = String(param1["remove-set-type"]);
         this.var_2114 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_2115 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_2115;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_2115 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2914;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_2116;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2913;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_2114;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_2114 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_2116 = param1;
      }
   }
}
