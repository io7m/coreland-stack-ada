with Test;
with Stack;

procedure t_init1 is
  package Int_Stack is new Stack (Element_Type => Natural);

  Stack  : Int_Stack.Stack_t;
  Caught : Boolean;
begin
  Test.Assert
    (Check        => Int_Stack.Size (Stack) = 0,
     Pass_Message => "Stack is empty",
     Fail_Message => "Stack not empty at initialization");

  -- catch Pop exception
  declare
    X : Natural;
  begin
    Int_Stack.Pop (Stack, X);
    Test.Assert
      (Check        => X'Valid,
       Pass_Message => "Valid X",
       Fail_Message => "Invalid X");
  exception
    when Constraint_Error => Caught := True;
  end;
  Test.Assert
    (Check        => Caught,
     Pass_Message => "Caught underflow",
     Fail_Message => "Failed to catch underflow");

  -- catch Pop exception
  begin
    Int_Stack.Pop_Discard (Stack);
  exception
    when Constraint_Error => Caught := True;
  end;
  Test.Assert
    (Check        => Caught,
     Pass_Message => "Caught underflow",
     Fail_Message => "Failed to catch underflow");

  -- catch Peek exception
  declare
    X : Natural;
  begin
    Int_Stack.Peek (Stack, X);
    Test.Assert
      (Check        => X'Valid,
       Pass_Message => "Valid X",
       Fail_Message => "Invalid X");
  exception
    when Constraint_Error => Caught := True;
  end;
  Test.Assert
    (Check        => Caught,
     Pass_Message => "Caught underflow",
     Fail_Message => "Failed to catch underflow");

end t_init1;
