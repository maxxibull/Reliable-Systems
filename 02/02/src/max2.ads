package Max2 with SPARK_Mode is

   type Vector is array (Integer range <>) of Positive;

   function FindMax2 (V : Vector) return Integer with
     Pre => V'First < Integer'Last and V'Length > 0,
     Post => FindMax2'Result >= 0 and
     (FindMax2'Result = 0 or
        (for some I in V'Range => FindMax2'Result = V(I))) and


     (if FindMax2'Result = 0 then
        (for all I in V'Range =>
             (for all J in V'Range => V(I) = V(J)))
            else
        (for all I in V'Range =>
             (if V(I) > FindMax2'Result then
                (for all J in V'Range => V(J) <= V(I)))));
end Max2;
