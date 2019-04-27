package Selection with SPARK_Mode is

   type Arr is array (Integer range <>) of Integer;
   
   function Sorted (A : Arr) return Boolean 
   is (for all I in A'First .. A'Last - 1 => A(I) <= A(I + 1))
     with 
       Ghost,
       Pre => A'Last > Integer'First;
   
   procedure Sort (A : in out Arr)
     with
       Pre => A'First in Integer'First + 1 .. Integer'Last - 1 and
       A'Last in Integer'First + 1 .. Integer'Last - 1,
       Post => Sorted(A);

end Selection;
