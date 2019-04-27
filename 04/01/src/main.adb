with Ada.Text_IO; use Ada.Text_IO;
with Railway; use Railway;

procedure Main is
   Result : Boolean;
begin
   --[Leave|Left|Middle|Right|Leave]
   --[ --> |     |     |     | <-- ]

   -- 1
   Open_Route (Route_Enter_Left, Result);
   Open_Route (Route_Enter_Right, Result);
   Move_Train (Route_Enter_Left, Result);
   Move_Train (Route_Enter_Right, Result);
   Put_Line ("1: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[     | --> |     | <-- |     ]

   -- 2
   Open_Route (Route_Left_Middle, Result);
   Open_Route (Route_Leave_Right, Result);
   Move_Train (Route_Left_Middle, Result);
   Move_Train (Route_Leave_Right, Result);
   Put_Line ("2: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[ --> |     | --> |     | --> ]

   -- 3
   Open_Route (Route_Middle_Right, Result);
   Open_Route (Route_Enter_Left, Result);
   Move_Train (Route_Middle_Right, Result);
   Move_Train (Route_Enter_Left, Result);
   Put_Line ("3: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[     | --> |     | --> |     ]

   -- 4
   Open_Route (Route_Right_Middle, Result);
   Move_Train (Route_Right_Middle, Result);
   Put_Line ("4: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[     | --- | <-- |     |     ]

   -- 5
   Open_Route (Route_Leave_Left, Result);
   Move_Train (Route_Leave_Left, Result);
   Put_Line ("5: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[ <-- |     | --- |     |     ]

   -- 6
   Open_Route (Route_Middle_Left, Result);
   Move_Train (Route_Middle_Left, Result);
   Put_Line ("6: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[ <-- |     |     |     |     ]

   -- 7
   Open_Route (Route_Leave_Left, Result);
   Move_Train (Route_Leave_Left, Result);
   Put_Line ("7: " & Segment_State.Left'Image & " | " & Segment_State.Middle'Image & " | " & Segment_State.Right'Image);
   --[ <-- |     |     |     |     ]


end Main;
