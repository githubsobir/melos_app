class BaseResult<T> {
  bool success;
  T? body;
  Object? exceptionBody;

  BaseResult({
    required this.success,
    this.exceptionBody,
    this.body,
  });
}
