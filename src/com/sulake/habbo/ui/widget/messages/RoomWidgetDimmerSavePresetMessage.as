package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_1025:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2648:int;
      
      private var var_2646:int;
      
      private var _color:uint;
      
      private var var_1188:int;
      
      private var var_2909:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_1025);
         this.var_2648 = param1;
         this.var_2646 = param2;
         this._color = param3;
         this.var_1188 = param4;
         this.var_2909 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2648;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2646;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1188;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2909;
      }
   }
}
