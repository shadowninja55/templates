{
  outputs = { self }: {
    templates = {
      poetry.path = ./poetry;
      rust.path = ./rust;
    };
  };
}
