package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_1027:String = "";
      
      public static const const_403:int = 0;
      
      public static const const_641:int = 255;
      
      public static const const_831:Boolean = false;
      
      public static const const_607:int = 0;
      
      public static const const_624:int = 0;
      
      public static const const_460:int = 0;
      
      public static const const_1210:int = 1;
      
      public static const const_1359:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2518:String = "";
      
      private var var_2212:int = 0;
      
      private var var_2767:int = 255;
      
      private var var_2768:Boolean = false;
      
      private var var_2765:int = 0;
      
      private var var_2766:int = 0;
      
      private var var_2764:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2518 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2518;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2212 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2212;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2767 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2767;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2768 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2768;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2765 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2765;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2766 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2766;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2764 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2764;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
