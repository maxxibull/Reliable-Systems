package Poly with SPARK_Mode is
   
   type Vector is array (Natural range <>) of Integer;
   
   function Horner (X : Integer; A : Vector) return Integer;
end Poly;
