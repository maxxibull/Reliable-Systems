package Railway with SPARK_Mode is
   type One_Signal_State is (Red, Green);

   type Route_Type is (Route_Left_Middle,
                       Route_Middle_Right,
                       Route_Right_Middle,
                       Route_Middle_Left,
                       Route_Enter_Left,
                       Route_Leave_Right,
                       Route_Enter_Right,
                       Route_Leave_Left);

   type One_Segment_State is (Occupied_Standing,
                              Occupied_Moving_Left,
                              Occupied_Moving_Right,
                              Reserved_Moving_From_Left,
                              Reserved_Moving_From_Right,
                              Free);

   type Segment_State_Type is
      record
         Left,
         Middle,
         Right : One_Segment_State;
      end record;

   type Signal_State_Type is
      record
         Left_Middle,
         Middle_Left,
         Middle_Right,
         Right_Middle: One_Signal_State;
      end record;

   Segment_State : Segment_State_Type := (others => Free);
   Signal_State  : Signal_State_Type  := (others => Green);

   function Correct_Signals return Boolean
   is
     (
        (if Signal_State.Left_Middle = Green then
              Segment_State.Left = Occupied_Moving_Right and
                Segment_State.Middle = Reserved_Moving_From_Left) and then
        (if Signal_state.Middle_Left = Green then
              Segment_State.Middle = Occupied_Moving_Left and
                Segment_State.Left = Reserved_Moving_From_Right) and then
        (if Signal_state.Middle_Right = Green then
              Segment_State.Middle = Occupied_Moving_Right and
                Segment_State.Right = Reserved_Moving_From_Left) and then
        (if Signal_state.Right_Middle = Green then
              Segment_State.Right = Occupied_Moving_Left and
                Segment_State.Middle = Reserved_Moving_From_Right));

   function Correct_Segments return Boolean
   is
     (
        (if Segment_State.Left /= Reserved_Moving_From_Right then
              Signal_State.Middle_Left = Red) and
        (if Segment_State.Middle /= Reserved_Moving_From_Left then
              Signal_State.Left_Middle = Red) and
        (if Segment_State.Middle /= Reserved_Moving_From_Right then
              Signal_State.Right_Middle = Red) and
        (if Segment_State.Right /= Reserved_Moving_From_Left then
              Signal_State.Middle_Right = Red));

   procedure Open_Route (Route: in Route_Type; Success: out Boolean)
     with
       Pre => Correct_Signals and Correct_Segments,
       Global => (In_Out => (Segment_State, Signal_State)),
       Depends => ((Segment_State, Success) => (Route, Segment_State),
                   Signal_State => (Segment_State, Route, Signal_State)),
       Post => Correct_Signals and Correct_Segments;

   procedure Move_Train (Route: in Route_Type; Success: out Boolean)
     with
       Pre => Correct_Signals and Correct_Segments,
       Global => (In_Out => (Segment_State, Signal_State)),
       Depends => ((Segment_State, Success) => (Route, Segment_State),
                   Signal_State => (Segment_State, Route, Signal_State)),
       Post => Correct_Signals and Correct_Segments;
end Railway;
