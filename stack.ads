with ada.containers.vectors;

generic
  type element_type is private;

package stack is

  type stack_t is private;

  procedure push
    (stack   : in out stack_t;
     element : element_type);

  procedure pop
    (stack   : in out stack_t;
     element : out element_type);

  procedure pop_discard
    (stack   : in out stack_t);

  procedure peek
    (stack   : in out stack_t;
     process : not null access procedure (element : element_type));

  procedure peek
    (stack   : in out stack_t;
     element : out element_type);

  procedure clear
    (stack : in out stack_t);

  function size
    (stack : stack_t) return natural;

private

  package stack_vectors is new ada.containers.vectors
    (index_type => natural, element_type => element_type);

  subtype count_t is ada.containers.count_type;

  type stack_t is record
    vector : stack_vectors.vector;
  end record;

end stack;
