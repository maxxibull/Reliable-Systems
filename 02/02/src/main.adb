with Ada.Text_IO; use Ada.Text_IO;
with Max2;

procedure Main is
begin
   Put_Line(Max2.FindMax2((1, 3, 4, 2, 5))'Image);
   null;
end Main;
