abstract class DataState<T> {
  final T? data;
  final String? message;
  final String? code;
  DataState({this.data, this.message, this.code});
}

class DataInit<T> extends DataState<T> {}

class DataLoading<T> extends DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({
    required T data,
  }) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required super.message, super.code});
}
