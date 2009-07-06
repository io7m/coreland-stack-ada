with Test;
with Stack;

procedure t_ops1 is
  package Int_Stack is new Stack (element_type => natural);

  Stack  : Int_Stack.Stack_t;

  procedure push
    (expected_value : natural;
     expected_Size  : natural)
  is
    got_value : natural;
    got_Size  : natural;
  begin
    Int_Stack.push (Stack, expected_value);
    Int_Stack.Peek (Stack, got_value);
    got_Size := Int_Stack.Size (Stack);

    Test.Assert
      (Check        => got_value = expected_value,
       Pass_Message => "push value " & natural'image (got_value) & " = " & natural'image (expected_value),
       Fail_Message => "push value " & natural'image (got_value) & " /= " & natural'image (expected_value));
    Test.Assert
      (Check        => got_Size = expected_Size,
       Pass_Message => "push Size " & natural'image (got_Size) & " = " & natural'image (expected_Size),
       Fail_Message => "push Size " & natural'image (got_Size) & " /= " & natural'image (expected_Size));
  end push;

  procedure Pop
    (expected_value : natural;
     expected_Size  : natural)
  is
    got_value : natural;
    got_Size  : natural;
  begin
    Int_Stack.Pop (Stack, got_value);
    got_Size := Int_Stack.Size (Stack);

    Test.Assert
      (Check        => got_value = expected_value,
       Pass_Message => "Pop value " & natural'image (got_value) & " = " & natural'image (expected_value),
       Fail_Message => "Pop value " & natural'image (got_value) & " /= " & natural'image (expected_value));
    Test.Assert
      (Check        => got_Size = expected_Size,
       Pass_Message => "Pop Size " & natural'image (got_Size) & " = " & natural'image (expected_Size),
       Fail_Message => "Pop Size " & natural'image (got_Size) & " /= " & natural'image (expected_Size));
  end Pop;

begin
  Test.Assert
    (Check        => Int_Stack.Size (Stack) = 0,
     Pass_Message => "Stack is empty",
     Fail_Message => "Stack not empty at initialization");

  push (expected_value => 100, expected_Size => 1);
  push (expected_value => 200, expected_Size => 2);
  push (expected_value => 300, expected_Size => 3);
  push (expected_value => 400, expected_Size => 4);
  push (expected_value => 500, expected_Size => 5);

  Pop (expected_value => 500, expected_Size => 4);
  Pop (expected_value => 400, expected_Size => 3);
  Pop (expected_value => 300, expected_Size => 2);
  Pop (expected_value => 200, expected_Size => 1);
  Pop (expected_value => 100, expected_Size => 0);

  push (expected_value => 100, expected_Size => 1);
  push (expected_value => 200, expected_Size => 2);
  push (expected_value => 300, expected_Size => 3);
  push (expected_value => 400, expected_Size => 4);
  push (expected_value => 500, expected_Size => 5);

  Int_Stack.clear (Stack);

  Test.Assert
    (Check        => Int_Stack.Size (Stack) = 0,
     Pass_Message => "Stack is empty",
     Fail_Message => "Stack not empty at initialization");

end t_ops1;
