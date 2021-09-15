{
  outputs = { self }: {
    templates = {
      poetry.path = ./poetry;
      python.path = ./python;
      rust.path = ./rust;
      purescript.path = ./purescript;
      haskell.path = ./haskell;
    };
  };
}
