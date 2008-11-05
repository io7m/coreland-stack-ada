package body stack is

  use type count_t;

  procedure push
    (stack   : in out stack_t;
     element : element_type) is
  begin
    stack_vectors.append (stack.vector, element);
  end push;

  procedure peek
    (stack   : stack_t;
     process : not null access procedure (element : element_type))
  is
    length : constant count_t := stack_vectors.length (stack.vector);
  begin
    stack_vectors.query_element
      (container => stack.vector,
       index     => natural (length - 1),
       process   => process);
  exception
    when constraint_error =>
      raise constraint_error with "stack underflow";
  end peek;

  procedure peek
    (stack   : stack_t;
     element : out element_type)
  is
    procedure peek_process (stack_element : element_type) is
    begin
      element := stack_element;
    end peek_process;
  begin
    peek (stack, peek_process'access);
  end peek;

  procedure pop
    (stack   : in out stack_t;
     element : out element_type) is
  begin
    peek (stack, element);
    stack_vectors.delete_last (stack.vector);
  end pop;

  procedure pop_discard
    (stack : in out stack_t)
  is
    dummy : element_type;
  begin
    pop (stack, dummy);
  end pop_discard;

  procedure clear
    (stack : in out stack_t) is
  begin
    stack_vectors.delete_first
      (container => stack.vector,
       count     => stack_vectors.length (stack.vector));
  end clear;

  function size
    (stack : stack_t) return natural is
  begin
    return natural (stack_vectors.length (stack.vector));
  end size;

end stack;
