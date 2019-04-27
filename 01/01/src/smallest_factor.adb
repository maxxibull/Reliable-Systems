with Ada.Numerics.Generic_Elementary_Functions;

procedure Smallest_Factor (N : in out Positive; Factor : out Positive)
  with
    SPARK_Mode,
    Pre => N > 1,
    Post => (Factor > 1) and
  (N'Old / Factor = N) and
  (N'Old rem Factor = 0) and
  (for all J in 2 .. Factor - 1 => N'Old rem J /= 0)
is
   Is_Smallest_Factor : Boolean := False;
begin
   Factor := 2;

   while Is_Smallest_Factor = False and Factor < N loop
      pragma Loop_Invariant (Factor > 1);
      pragma Loop_Invariant (for all J in 2 .. Factor - 1 => N rem J /= 0);

      if N rem Factor = 0 then
         Is_Smallest_Factor := True;
      else
         Factor := Factor + 1;
      end if;
   end loop;

   N := N / Factor;
end Smallest_Factor;
