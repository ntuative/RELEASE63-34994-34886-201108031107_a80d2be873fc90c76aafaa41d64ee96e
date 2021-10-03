package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2140:int = 0;
      
      public static const const_1758:int = 1;
      
      public static const const_2054:int = 2;
      
      public static const const_2302:int = 3;
      
      public static const const_2221:int = 4;
      
      public static const const_2143:int = 5;
      
      public static const const_1835:int = 10;
      
      public static const const_2294:int = 11;
      
      public static const const_2300:int = 12;
      
      public static const const_2173:int = 13;
      
      public static const const_2147:int = 16;
      
      public static const const_2262:int = 17;
      
      public static const const_2157:int = 18;
      
      public static const const_2164:int = 19;
      
      public static const const_2301:int = 20;
      
      public static const const_2224:int = 22;
      
      public static const const_2345:int = 23;
      
      public static const const_2311:int = 24;
      
      public static const const_2145:int = 25;
      
      public static const const_2284:int = 26;
      
      public static const const_2208:int = 27;
      
      public static const const_2289:int = 28;
      
      public static const const_2274:int = 29;
      
      public static const const_2263:int = 100;
      
      public static const const_2362:int = 101;
      
      public static const const_2342:int = 102;
      
      public static const const_2320:int = 103;
      
      public static const const_2166:int = 104;
      
      public static const const_2186:int = 105;
      
      public static const const_2298:int = 106;
      
      public static const const_2296:int = 107;
      
      public static const const_2273:int = 108;
      
      public static const const_2280:int = 109;
      
      public static const const_2150:int = 110;
      
      public static const const_2250:int = 111;
      
      public static const const_2223:int = 112;
      
      public static const const_2244:int = 113;
      
      public static const const_2276:int = 114;
      
      public static const const_2288:int = 115;
      
      public static const const_2218:int = 116;
      
      public static const const_2258:int = 117;
      
      public static const const_2264:int = 118;
      
      public static const const_2149:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_9 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1758:
            case const_1835:
               return "banned";
            case const_2054:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
