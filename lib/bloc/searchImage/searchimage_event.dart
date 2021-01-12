part of 'searchimage_bloc.dart';

abstract class SearchimageEvent extends Equatable {
  const SearchimageEvent();

  @override
  List<Object> get props => [];
}

class SearchImages extends SearchimageEvent {
  final String query;
  SearchImages({@required this.query});
  @override
  List<Object> get props => [query];
}

class ImagesPaginate extends SearchimageEvent {}