package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1057:int = 10;
      
      private static const const_732:int = 20;
      
      private static const const_1488:int = 31;
      
      private static const const_1489:int = 32;
       
      
      private var var_354:Array;
      
      private var var_935:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_354 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_935)
            {
               this.var_935 = true;
               this.var_354 = new Array();
               this.var_354.push(const_1488);
               this.var_354.push(const_1489);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_1057)
         {
            if(this.var_935)
            {
               this.var_935 = false;
               this.var_354 = new Array();
               this.var_354.push(const_1057 + param1);
               this.var_354.push(const_732 + param1);
               this.var_354.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_354.length > 0)
            {
               super.setAnimation(this.var_354.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
