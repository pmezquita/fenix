class ResultApiValidateTokenUser {
  final int? result;

  ResultApiValidateTokenUser(this.result);

  bool get isOk => result == 0;

  bool get hasError => (result ?? 1) > 0;

  bool get isDesactivated => result == -1;
}
