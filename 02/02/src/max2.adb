package body Max2 with SPARK_Mode is

   function FindMax2 (V : Vector) return Integer
   is
      SecondMax : Natural := 0;
      CurrentMax : Natural := 0;
   begin
      for I in V'Range loop
         if V(I) > CurrentMax then
            SecondMax := CurrentMax;
            CurrentMax := V(I);
         elsif V(I) > SecondMax and V(I) < CurrentMax then
            SecondMax := V(I);
         end if;

         pragma Loop_Invariant (for all J in V'First .. I => V(J) <= CurrentMax);
         pragma Loop_Invariant (for some J in V'First .. I => V(J) = CurrentMax);
         pragma Loop_Invariant (
                                ((for some J in V'First .. I => V(J) = SecondMax) and
                                  (for all J in V'First .. I => (if V(J) > SecondMax then (for all K in V'First .. I => V(K) <= V(J)))))
                                or
                                  (SecondMax = 0 and (for all J in V'First .. I => V(J) = CurrentMax))
                               );
      end loop;

      return SecondMax;
   end FindMax2;

end Max2;
