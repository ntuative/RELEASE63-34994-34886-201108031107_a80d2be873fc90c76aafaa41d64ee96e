package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_754:String;
      
      private var var_2383:String;
      
      private var _gender:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_754 = param1;
         this._gender = param2;
         this.var_2383 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_754;
      }
      
      public function get race() : String
      {
         return this.var_2383;
      }
      
      public function get gender() : String
      {
         return this._gender;
      }
   }
}
