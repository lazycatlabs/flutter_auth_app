mixin CoreMapper<M, D> {
  D mapToDomain(M model);

  M mapToModel(D domain);
}
