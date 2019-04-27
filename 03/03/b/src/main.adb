with Ada.Text_IO; use Ada.Text_IO;
with Bubble;

procedure Main is
   Unsorted_Array : Bubble.Arr := (12, 3, 4, 22, 2, 1, 13, 1, 1);
begin
   Bubble.Sort(Unsorted_Array);

   for I in Unsorted_Array'Range loop
      Put_Line (Unsorted_Array(I)'Image);
      end loop;
end Main;
