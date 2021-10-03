package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1057:int = 20;
      
      private static const const_732:int = 10;
      
      private static const const_1488:int = 31;
      
      private static const const_1489:int = 32;
      
      private static const const_731:int = 30;
       
      
      private var var_354:Array;
      
      private var var_935:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_354 = new Array();
         super();
         super.setAnimation(const_731);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_732)
         {
            if(this.var_935)
            {
               this.var_935 = false;
               this.var_354 = new Array();
               if(direction == 2)
               {
                  this.var_354.push(const_1057 + 5 - param1);
                  this.var_354.push(const_732 + 5 - param1);
               }
               else
               {
                  this.var_354.push(const_1057 + param1);
                  this.var_354.push(const_732 + param1);
               }
               this.var_354.push(const_731);
               return;
            }
            super.setAnimation(const_731);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
