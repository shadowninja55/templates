{
  outputs = { self }: {
    templates = {
      python.path = ./python;
      rust.path = ./rust;
    };
  };
}
