function Mult (A : Natural; B : Natural) return Natural with
  SPARK_Mode,
  Pre => A < 32768 and B < 32768,
  Post => Mult'Result = A * B
is
   AB : Natural := 0;
   AA : Natural := A;
   B1 : Natural := B;
begin
   while B1 > 0 loop
      if B1 mod 2 = 1 then
         AB := AB + AA;
      end if;

      AA := 2 * AA;
      B1 := B1 / 2;

      pragma Loop_Invariant (A * B = AA * B1 + AB);
   end loop;

   return AB;
end Mult;
