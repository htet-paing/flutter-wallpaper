part of 'searchimage_bloc.dart';

abstract class SearchimageState extends Equatable {
  const SearchimageState();

  @override
  List<Object> get props => [];
}

class SearchimageInitial extends SearchimageState {}

class SearchImageLoading extends SearchimageState {}

class SearchImageLoaded extends SearchimageState {
  final List<Hit> images;
  SearchImageLoaded({this.images});
  @override
  List<Object> get props => [images];
}

class SearchImageError extends SearchimageState {
  final String message;
  SearchImageError({this.message});

  @override
  List<Object> get props => [message];
}
