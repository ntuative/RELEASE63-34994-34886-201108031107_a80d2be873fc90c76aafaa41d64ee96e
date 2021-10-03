package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1489:int = 3;
      
      private static const const_1574:int = 2;
      
      private static const const_1572:int = 1;
      
      private static const const_1573:int = 15;
       
      
      private var var_354:Array;
      
      private var var_1270:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_354 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1574)
         {
            this.var_354 = new Array();
            this.var_354.push(const_1572);
            this.var_1270 = const_1573;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1270 > 0)
         {
            --this.var_1270;
         }
         if(this.var_1270 == 0)
         {
            if(this.var_354.length > 0)
            {
               super.setAnimation(this.var_354.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
