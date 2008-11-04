with test;
with stack;

procedure t_ops1 is
  package int_stack is new stack (element_type => natural);

  stack  : int_stack.stack_t;

  procedure push
    (expected_value : natural;
     expected_size  : natural)
  is
    got_value : natural;
    got_size  : natural;
  begin
    int_stack.push (stack, expected_value);
    int_stack.peek (stack, got_value);
    got_size := int_stack.size (stack);

    test.assert
      (check        => got_value = expected_value,
       pass_message => "push value " & natural'image (got_value) & " = " & natural'image (expected_value),
       fail_message => "push value " & natural'image (got_value) & " /= " & natural'image (expected_value));
    test.assert
      (check        => got_size = expected_size,
       pass_message => "push size " & natural'image (got_size) & " = " & natural'image (expected_size),
       fail_message => "push size " & natural'image (got_size) & " /= " & natural'image (expected_size));
  end push;

  procedure pop
    (expected_value : natural;
     expected_size  : natural)
  is
    got_value : natural;
    got_size  : natural;
  begin
    int_stack.pop (stack, got_value);
    got_size := int_stack.size (stack);

    test.assert
      (check        => got_value = expected_value,
       pass_message => "pop value " & natural'image (got_value) & " = " & natural'image (expected_value),
       fail_message => "pop value " & natural'image (got_value) & " /= " & natural'image (expected_value));
    test.assert
      (check        => got_size = expected_size,
       pass_message => "pop size " & natural'image (got_size) & " = " & natural'image (expected_size),
       fail_message => "pop size " & natural'image (got_size) & " /= " & natural'image (expected_size));
  end pop;

begin
  test.assert
    (check        => int_stack.size (stack) = 0,
     pass_message => "stack is empty",
     fail_message => "stack not empty at initialization");

  push (expected_value => 100, expected_size => 1);
  push (expected_value => 200, expected_size => 2);
  push (expected_value => 300, expected_size => 3);
  push (expected_value => 400, expected_size => 4);
  push (expected_value => 500, expected_size => 5);

  pop (expected_value => 500, expected_size => 4);
  pop (expected_value => 400, expected_size => 3);
  pop (expected_value => 300, expected_size => 2);
  pop (expected_value => 200, expected_size => 1);
  pop (expected_value => 100, expected_size => 0);

  push (expected_value => 100, expected_size => 1);
  push (expected_value => 200, expected_size => 2);
  push (expected_value => 300, expected_size => 3);
  push (expected_value => 400, expected_size => 4);
  push (expected_value => 500, expected_size => 5);

  int_stack.clear (stack);

  test.assert
    (check        => int_stack.size (stack) = 0,
     pass_message => "stack is empty",
     fail_message => "stack not empty at initialization");

end t_ops1;
