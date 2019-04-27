package body Selection with SPARK_Mode is

   procedure Sort (A : in out Arr) is
      Index_Min : Integer;
      Temp_Swap : Integer;
   begin
      for I in A'First .. A'Last - 1 loop
         Index_Min := I;

         for J in I + 1 .. A'Last loop
            pragma Loop_Invariant (Index_Min in I .. A'Last);
            pragma Loop_Invariant (for all K in I .. J - 1 => A(Index_Min) <= A(K));

            if A(J) < A(Index_Min) then
               Index_Min := J;
            end if;
         end loop;

         if Index_Min /= I then
            Temp_Swap := A(I);
            A(I) := A(Index_Min);
            A(Index_Min) := Temp_Swap;
         end if;

         pragma Loop_Invariant (for all K in A'First .. I =>
                                  (for all L in K + 1 .. A'Last => A(K) <= A(L)));
      end loop;
   end Sort;

end Selection;
