with Ada.Text_IO; use Ada.Text_IO;
with Bubble;

procedure Main is
   Unsorted_Array : Bubble.Arr := (10, 2, 11, 13, 3, 1, 4, 7);
begin
   Bubble.Sort(Unsorted_Array);

   for I in Unsorted_Array'Range loop
      Put_Line (Unsorted_Array(I)'Image);
      end loop;
end Main;
