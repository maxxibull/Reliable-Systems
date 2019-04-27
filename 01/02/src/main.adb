with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Poly;

procedure Main is
begin
   Ada.Integer_Text_IO.Put(Poly.Horner(0, (0 => 0)));
end Main;
