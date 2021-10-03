package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2648:int;
      
      private var var_2646:int;
      
      private var var_2650:String;
      
      private var var_2649:int;
      
      private var var_2647:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2648 = param1;
         this.var_2646 = param2;
         this.var_2650 = param3;
         this.var_2649 = param4;
         this.var_2647 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2648,this.var_2646,this.var_2650,this.var_2649,int(this.var_2647)];
      }
      
      public function dispose() : void
      {
      }
   }
}
