import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  DataError(String error) : super(error: error);
}
