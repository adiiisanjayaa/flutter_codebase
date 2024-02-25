/// Base Result class
/// [T] represents the type of the success value
sealed class Result<T> {
  const Result();
}

final class SuccessRes<T> extends Result<T> {
  const SuccessRes(this.value);
  final T value;
}

final class FailureRes<T> extends Result<T> {
  const FailureRes(this.error);
  final Object error;
}
