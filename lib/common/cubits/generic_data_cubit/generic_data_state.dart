part of 'generic_data_cubit.dart';

sealed class GenericDataState {}

final class DataInitial extends GenericDataState {}

final class DataLoading extends GenericDataState {}

final class DataLoaded<T> extends GenericDataState {
  final T data;

  DataLoaded({required this.data});
}

final class DataFailed extends GenericDataState {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}
