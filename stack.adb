package body Stack is

  use type Count_t;

  procedure Push
    (Stack   : in out Stack_t;
     Element : in     Element_Type) is
  begin
    Stack_Vectors.Append (Stack.Vector, Element);
  end Push;

  procedure Peek
    (Stack   : in Stack_t;
     Process : not null access procedure (Element : Element_Type))
  is
    Length : constant Count_t := Stack_Vectors.Length (Stack.Vector);
  begin
    Stack_Vectors.Query_Element
      (Container => Stack.Vector,
       Index     => Natural (Length - 1),
       Process   => Process);
  exception
    when Constraint_Error =>
      raise Constraint_Error with "Stack underflow";
  end Peek;

  procedure Peek
    (Stack   : in     Stack_t;
     Element :    out Element_Type)
  is
    procedure Peek_Process (Stack_Element : Element_Type) is
    begin
      Element := Stack_Element;
    end Peek_Process;
  begin
    Peek (Stack, Peek_Process'Access);
  end Peek;

  procedure Pop
    (Stack   : in out Stack_t;
     Element :    out Element_Type) is
  begin
    Peek (Stack, Element);
    Stack_Vectors.Delete_Last (Stack.Vector);
  end Pop;

  procedure Pop_Discard
    (Stack : in out Stack_t)
  is
    Dummy : Element_Type;
  begin
    Pop (Stack, Dummy);
  end Pop_Discard;

  procedure Clear
    (Stack : in out Stack_t) is
  begin
    Stack_Vectors.Delete_First
      (Container => Stack.Vector,
       Count     => Stack_Vectors.Length (Stack.Vector));
  end Clear;

  function Size
    (Stack : Stack_t) return Natural is
  begin
    return Natural (Stack_Vectors.Length (Stack.Vector));
  end Size;

end Stack;
