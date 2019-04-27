with Ada.Text_IO; use Ada.Text_IO;

function Sqrt0 (X : Float; Tolerance : Float) return Float with
  SPARK_Mode,
  Pre => X >= 0.0 and X <= 1.8E19 and Tolerance > Float'Model_Epsilon and Tolerance <= 1.0,
  Post => abs (X - Sqrt0'Result ** 2) <= X * Tolerance
is
   Left : Float;
   Right : Float;
   Approx : Float := X;
begin
   if X > 1.0 then
      Left := 1.0;
      Right := X;
   else
      Left := X;
      Right := 1.0;
   end if;

   while abs (X - Approx ** 2) > Tolerance * X loop
      Approx := Left + (Right - Left) / 2.0;

      if Approx ** 2 >= X then
         Right := Approx;
      else
         Left := Approx;
      end if;

   end loop;

   return Approx;
end Sqrt0;
