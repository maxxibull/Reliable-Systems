package Bubble with SPARK_Mode is
   type Arr is array (Integer range <>) of Integer;

   function Sorted (A : Arr) return Boolean
   is (for all I in A'First .. A'Last - 1 => A(I) <= A(I + 1)) with
     Ghost,
     Pre => A'Last > Integer'First,
     Post => Sorted'Result = (for all I in A'First .. A'Last - 1 => A(I) <= A(I + 1));

   function Bubbled (A : Arr) return Boolean
   is (for all I in A'First .. A'Last - 1 => A(I) <= A(A'Last)) with
     Ghost,
     Pre => A'Last > Integer'First,
     Post => Bubbled'Result = (for all I in A'First .. A'Last - 1 => A(I) <= A(A'Last));

   procedure Sort (A : in out Arr) with
     Pre => A'Last > Integer'First and A'Last < Integer'Last,
     Post => (for all I in A'Range => (for some J in A'Range => A(I) = A'Old(J)));
end Bubble;
