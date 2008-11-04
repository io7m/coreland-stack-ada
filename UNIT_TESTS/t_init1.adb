with test;
with stack;

procedure t_init1 is
  package int_stack is new stack (element_type => natural);

  stack  : int_stack.stack_t;
  caught : boolean;
begin
  test.assert
    (check        => int_stack.size (stack) = 0,
     pass_message => "stack is empty",
     fail_message => "stack not empty at initialization");

  -- catch pop exception
  declare
    x : natural;
  begin
    int_stack.pop (stack, x);
    test.assert
      (check        => x'valid,
       pass_message => "valid x",
       fail_message => "invalid x");
  exception
    when constraint_error => caught := true;
  end;
  test.assert
    (check        => caught,
     pass_message => "caught underflow",
     fail_message => "failed to catch underflow");

  -- catch pop exception
  begin
    int_stack.pop_discard (stack);
  exception
    when constraint_error => caught := true;
  end;
  test.assert
    (check        => caught,
     pass_message => "caught underflow",
     fail_message => "failed to catch underflow");

  -- catch peek exception
  declare
    x : natural;
  begin
    int_stack.peek (stack, x);
    test.assert
      (check        => x'valid,
       pass_message => "valid x",
       fail_message => "invalid x");
  exception
    when constraint_error => caught := true;
  end;
  test.assert
    (check        => caught,
     pass_message => "caught underflow",
     fail_message => "failed to catch underflow");

end t_init1;
