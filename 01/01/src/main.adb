with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Smallest_Factor;

procedure Main is
   Temp : Positive;
   N : Positive := 21;
begin
   Smallest_Factor(N, Temp);
   Ada.Integer_Text_IO.Put(N);
end Main;
