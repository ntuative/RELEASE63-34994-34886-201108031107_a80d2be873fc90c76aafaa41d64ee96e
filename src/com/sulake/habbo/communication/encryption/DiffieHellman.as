package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1048:BigInteger;
      
      private var var_2669:BigInteger;
      
      private var var_2147:BigInteger;
      
      private var var_2974:BigInteger;
      
      private var var_1659:BigInteger;
      
      private var var_2148:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1659 = param1;
         this.var_2148 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1659.toString() + ",generator: " + this.var_2148.toString() + ",secret: " + param1);
         this.var_1048 = new BigInteger();
         this.var_1048.fromRadix(param1,param2);
         this.var_2669 = this.var_2148.modPow(this.var_1048,this.var_1659);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2147 = new BigInteger();
         this.var_2147.fromRadix(param1,param2);
         this.var_2974 = this.var_2147.modPow(this.var_1048,this.var_1659);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2669.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2974.toRadix(param1);
      }
   }
}
