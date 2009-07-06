with Ada.Containers.Vectors;

generic
  type Element_Type is private;

package Stack is

  type Stack_t is private;

  procedure Push
    (Stack   : in out Stack_t;
     Element : in     Element_Type);

  procedure Pop
    (Stack   : in out Stack_t;
     Element :    out Element_Type);

  procedure Pop_Discard
    (Stack   : in out Stack_t);

  procedure Peek
    (Stack   : in     Stack_t;
     Process : not null access procedure (Element : Element_Type));

  procedure Peek
    (Stack   : in     Stack_t;
     Element :    out Element_Type);

  procedure Clear
    (Stack : in out Stack_t);

  function Size
    (Stack : in Stack_t) return Natural;

private

  package Stack_Vectors is new Ada.Containers.Vectors
    (Index_Type => Natural, Element_Type => Element_Type);

  subtype Count_t is Ada.Containers.Count_Type;

  type Stack_t is record
    Vector : Stack_Vectors.Vector;
  end record;

end Stack;
