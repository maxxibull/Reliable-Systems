function IsPrime (N : in Positive) return Boolean
  with
    SPARK_Mode,
    Pre => N >= 2,
    Post => (if IsPrime'Result then
               (for all I in 2 .. N - 1 => N rem I /= 0)
                   else
               (for some I in 2 .. N - 1 => N rem I = 0))
is
begin
   for I in 2 .. N - 1 loop
      if N rem I = 0 then
         return False;
      end if;

      pragma Loop_Invariant(N rem I /= 0);
      pragma Loop_Invariant(for all J in 2 .. I - 1 => N rem J /= 0);
   end loop;

   return True;

end IsPrime;
