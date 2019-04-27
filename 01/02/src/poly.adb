package body Poly with SPARK_Mode is

   function Horner (X : Integer; A : Vector) return Integer is
      Horner : Integer := 0;
      Natural : Integer := 0 with Ghost;
   begin
      for I in reverse A'First .. A'Last loop
         Natural := Natural + A(I) * (X ** (I - A'First));
         Horner := Horner * X + A(I);

         pragma Loop_Invariant (Natural = (X ** (I - A'First)) * Horner);
      end loop;

      pragma Assert (Horner = Natural);

      return Horner;
   end Horner;
end Poly;
