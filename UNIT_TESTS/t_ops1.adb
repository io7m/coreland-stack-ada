with Test;
with Stack;

procedure t_ops1 is
  package Int_Stack is new Stack (element_type => Natural);

  Stack  : Int_Stack.Stack_t;

  procedure Push
    (Expected_Value : Natural;
     Expected_Size  : Natural)
  is
    Got_value : Natural;
    Got_Size  : Natural;
  begin
    Int_Stack.Push (Stack, Expected_Value);
    Int_Stack.Peek (Stack, Got_value);
    Got_Size := Int_Stack.Size (Stack);

    Test.Assert
      (Check        => Got_value = Expected_Value,
       Pass_Message => "Push value " & Natural'Image (Got_value) & " = " & Natural'Image (Expected_Value),
       Fail_Message => "Push value " & Natural'Image (Got_value) & " /= " & Natural'Image (Expected_Value));
    Test.Assert
      (Check        => Got_Size = Expected_Size,
       Pass_Message => "Push Size " & Natural'Image (Got_Size) & " = " & Natural'Image (Expected_Size),
       Fail_Message => "Push Size " & Natural'Image (Got_Size) & " /= " & Natural'Image (Expected_Size));
  end Push;

  procedure Pop
    (Expected_Value : Natural;
     Expected_Size  : Natural)
  is
    Got_value : Natural;
    Got_Size  : Natural;
  begin
    Int_Stack.Pop (Stack, Got_value);
    Got_Size := Int_Stack.Size (Stack);

    Test.Assert
      (Check        => Got_value = Expected_Value,
       Pass_Message => "Pop value " & Natural'Image (Got_value) & " = " & Natural'Image (Expected_Value),
       Fail_Message => "Pop value " & Natural'Image (Got_value) & " /= " & Natural'Image (Expected_Value));
    Test.Assert
      (Check        => Got_Size = Expected_Size,
       Pass_Message => "Pop Size " & Natural'Image (Got_Size) & " = " & Natural'Image (Expected_Size),
       Fail_Message => "Pop Size " & Natural'Image (Got_Size) & " /= " & Natural'Image (Expected_Size));
  end Pop;

begin
  Test.Assert
    (Check        => Int_Stack.Size (Stack) = 0,
     Pass_Message => "Stack is empty",
     Fail_Message => "Stack not empty at initialization");

  Push (Expected_Value => 100, Expected_Size => 1);
  Push (Expected_Value => 200, Expected_Size => 2);
  Push (Expected_Value => 300, Expected_Size => 3);
  Push (Expected_Value => 400, Expected_Size => 4);
  Push (Expected_Value => 500, Expected_Size => 5);

  Pop (Expected_Value => 500, Expected_Size => 4);
  Pop (Expected_Value => 400, Expected_Size => 3);
  Pop (Expected_Value => 300, Expected_Size => 2);
  Pop (Expected_Value => 200, Expected_Size => 1);
  Pop (Expected_Value => 100, Expected_Size => 0);

  Push (Expected_Value => 100, Expected_Size => 1);
  Push (Expected_Value => 200, Expected_Size => 2);
  Push (Expected_Value => 300, Expected_Size => 3);
  Push (Expected_Value => 400, Expected_Size => 4);
  Push (Expected_Value => 500, Expected_Size => 5);

  Int_Stack.Clear (Stack);

  Test.Assert
    (Check        => Int_Stack.Size (Stack) = 0,
     Pass_Message => "Stack is empty",
     Fail_Message => "Stack not empty at initialization");

end t_ops1;
