package body Railway with SPARK_Mode is
   procedure Open_Route (Route: in Route_Type; Success: out Boolean) is
   begin
      if Route = Route_Enter_Left and Segment_State.Left = Free then
         Segment_State.Left := Reserved_Moving_From_Left;
         Success := True;
      elsif Route = Route_Left_Middle and Segment_State.Left = Occupied_Standing
        and Segment_State.Middle = Free  then
         Segment_State.Left := Occupied_Moving_Right;
         Segment_State.Middle := Reserved_Moving_From_Left;
         Signal_State.Left_Middle := Green;
         Success := True;
      elsif Route = Route_Middle_Right and Segment_State.Middle = Occupied_Standing
        and Segment_State.Right = Free then
         Segment_State.Middle := Occupied_Moving_Right;
         Segment_State.Right := Reserved_Moving_From_Left;
         Signal_State.Middle_Right := Green;
         Success := True;
      elsif Route = Route_Leave_Right and Segment_State.Right = Occupied_Standing then
         Segment_State.Right := Occupied_Moving_Right;
         Success := True;
      elsif Route = Route_Enter_Right and Segment_State.Right = Free then
         Segment_State.Right := Reserved_Moving_From_Right;
         Success := True;
      elsif Route = Route_Right_Middle and Segment_State.Right = Occupied_Standing
        and Segment_State.Middle = Free then
         Segment_State.Right := Occupied_Moving_Left;
         Segment_State.Middle := Reserved_Moving_From_Right;
         Signal_State.Right_Middle := Green;
         Success := True;
      elsif Route = Route_Middle_Left and Segment_State.Middle = Occupied_Standing
        and Segment_State.Left = Free then
         Segment_State.Middle := Occupied_Moving_Left;
         Segment_State.Left := Reserved_Moving_From_Right;
         Signal_State.Middle_Left := Green;
         Success := True;
      elsif Route = Route_Leave_Left and Segment_State.Left = Occupied_Standing then
         Segment_State.Left := Occupied_Moving_Left;
         Success := True;
      else
         Success := False;
      end if;
   end Open_Route;

   procedure Move_Train (Route: in Route_Type; Success: out Boolean) is
   begin
      if Route = Route_Enter_Left and Segment_State.Left = Reserved_Moving_From_Left then
         Segment_State.Left := Occupied_Standing;
         Success := True;
      elsif Route = Route_Left_Middle and Segment_State.Left = Occupied_Moving_Right
        and Segment_State.Middle = Reserved_Moving_From_Left then
         Segment_State.Left := Free;
         Segment_State.Middle := Occupied_Standing;
         Signal_State.Left_Middle := Red;
         Success := True;
      elsif Route = Route_Middle_Right and Segment_State.Middle = Occupied_Moving_Right
        and Segment_State.Right = Reserved_Moving_From_Left then
         Segment_State.Middle := Free;
         Segment_State.Right := Occupied_Standing;
         Signal_State.Middle_Right := Red;
         Success := True;
      elsif Route = Route_Leave_Right and Segment_State.Right = Occupied_Moving_Right then
         Segment_State.Right := Free;
         Success := True;
      elsif Route = Route_Enter_Right and Segment_State.Right = Reserved_Moving_From_Right then
         Segment_State.Right := Occupied_Standing;
         Success := True;
      elsif Route = Route_Right_Middle and Segment_State.Right = Occupied_Moving_Left
        and Segment_State.Middle = Reserved_Moving_From_Right then
         Segment_State.Right := Free;
         Segment_State.Middle := Occupied_Standing;
         Signal_State.Right_Middle := Red;
         Success := True;
      elsif Route = Route_Middle_Left and Segment_State.Middle = Occupied_Moving_Left
        and Segment_State.Left = Reserved_Moving_From_Right then
         Segment_State.Middle := Free;
         Segment_State.Left := Occupied_Standing;
         Signal_State.Middle_Left := Red;
         Success := True;
      elsif Route = Route_Leave_Left and Segment_State.Left = Occupied_Moving_Left then
         Segment_State.Left := Free;
         Success := True;
      else
         Success := False;
      end if;
   end Move_Train;
end Railway;
