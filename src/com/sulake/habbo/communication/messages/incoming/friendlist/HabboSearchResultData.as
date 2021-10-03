package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2439:int;
      
      private var var_2149:String;
      
      private var var_2614:String;
      
      private var var_2616:Boolean;
      
      private var var_2612:Boolean;
      
      private var var_2615:int;
      
      private var var_2613:String;
      
      private var var_2617:String;
      
      private var var_1819:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2439 = param1.readInteger();
         this.var_2149 = param1.readString();
         this.var_2614 = param1.readString();
         this.var_2616 = param1.readBoolean();
         this.var_2612 = param1.readBoolean();
         param1.readString();
         this.var_2615 = param1.readInteger();
         this.var_2613 = param1.readString();
         this.var_2617 = param1.readString();
         this.var_1819 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2439;
      }
      
      public function get avatarName() : String
      {
         return this.var_2149;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2614;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2616;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2612;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2615;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2613;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2617;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
   }
}
