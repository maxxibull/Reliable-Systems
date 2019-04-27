with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Selection;

procedure Main is
   A : Selection.Arr := (10, 29, 31, 22, 1, 9, -12, 0, 3);
begin
   Selection.Sort(A);
   for I in A'First .. A'Last loop
      Ada.Integer_Text_IO.Put(A(I));
   end loop;
end Main;
