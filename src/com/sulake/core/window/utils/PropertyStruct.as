package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_152:String = "hex";
      
      public static const const_35:String = "int";
      
      public static const const_271:String = "uint";
      
      public static const const_128:String = "Number";
      
      public static const const_39:String = "Boolean";
      
      public static const const_52:String = "String";
      
      public static const const_245:String = "Point";
      
      public static const const_301:String = "Rectangle";
      
      public static const const_166:String = "Array";
      
      public static const const_257:String = "Map";
       
      
      private var var_663:String;
      
      private var var_199:Object;
      
      private var _type:String;
      
      private var var_2552:Boolean;
      
      private var var_3096:Boolean;
      
      private var var_2553:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_663 = param1;
         this.var_199 = param2;
         this._type = param3;
         this.var_2552 = param4;
         this.var_3096 = param3 == const_257 || param3 == const_166 || param3 == const_245 || param3 == const_301;
         this.var_2553 = param5;
      }
      
      public function get key() : String
      {
         return this.var_663;
      }
      
      public function get value() : Object
      {
         return this.var_199;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2552;
      }
      
      public function get range() : Array
      {
         return this.var_2553;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_152:
               return "0x" + uint(this.var_199).toString(16);
            case const_39:
               return Boolean(this.var_199) == true ? "true" : "AnimationAction";
            case const_245:
               return "Point(" + Point(this.var_199).x + ", " + Point(this.var_199).y + ")";
            case const_301:
               return "Rectangle(" + Rectangle(this.var_199).x + ", " + Rectangle(this.var_199).y + ", " + Rectangle(this.var_199).width + ", " + Rectangle(this.var_199).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_257:
               _loc3_ = this.var_199 as Map;
               _loc1_ = "<var key=\"" + this.var_663 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_166:
               _loc4_ = this.var_199 as Array;
               _loc1_ = "<var key=\"" + this.var_663 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_245:
               _loc5_ = this.var_199 as Point;
               _loc1_ = "<var key=\"" + this.var_663 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_35 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_35 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_301:
               _loc6_ = this.var_199 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_663 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_35 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_35 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_35 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_35 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_152:
               _loc1_ = "<var key=\"" + this.var_663 + "\" value=\"" + "0x" + uint(this.var_199).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_663 + "\" value=\"" + this.var_199 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
