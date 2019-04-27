package body Bubble with SPARK_Mode is
   procedure Sort (A : in out Arr)
   is
      Temp : Integer;
   begin
       Outer : for I in reverse A'First .. A'Last - 1 loop
         Inner : for J in A'First .. I loop
            if A (J) > A(J + 1) then
               Temp  := A (J);
               A (J) := A (J + 1);
               A (J + 1) := Temp;
            end if;

            pragma Loop_Invariant (for all K1 in J .. J + 1 => (for some K2 in A'Range => A(K1) = A'Loop_Entry(Inner)(K2)));
            pragma Loop_Invariant (Bubbled (A (A'First .. J + 1)));
            pragma Loop_Invariant (for all K1 in A'First .. I + 1 => (for some K2 in A'First .. I + 1 => A(K1) = A'Loop_Entry(Inner)(K2)));
            --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K1) = A'Loop_Entry(Inner)(K2)));
            --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K2) = A'Loop_Entry(Inner)(K1)));
            pragma Loop_Invariant (for all K in I + 2 .. A'Last => A(K) = A'Loop_Entry(Inner)(K));
         end loop Inner;

         pragma Loop_Invariant (Sorted (A (I .. A'Last)));
         pragma Loop_Invariant (Bubbled (A (A'First .. I + 1)));
         --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K1) = A'Loop_Entry(Outer)(K2)));
         --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K2) = A'Loop_Entry(Outer)(K1)));
      end loop Outer;
   end Sort;
end Bubble;
