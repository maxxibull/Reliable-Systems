with Ada.Text_IO; use Ada.Text_IO;
with Rev;

procedure Main is
   Temp : String := "Hello World";
begin
   Rev (Temp);
   Put_Line (Temp);
end Main;
