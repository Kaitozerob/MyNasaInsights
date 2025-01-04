sealed class Resource<T> {
  final T? data;
  final String? message;

  const Resource({this.data, this.message});
}

class Success<T> extends Resource<T> {
  const Success(T data) : super(data: data);
}

class Error<T> extends Resource<T> {
  const Error(String message, {T? data}) : super(message: message, data: data);
}

class Loading<T> extends Resource<T> {
  const Loading({String? message}) : super(message: message);
}