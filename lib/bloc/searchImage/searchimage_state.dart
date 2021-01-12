part of 'searchimage_bloc.dart';

enum ImagesStatus {
  searchImageInitial,
  searchImageLoading,
  searchImageLoaded,
  searchImagePaginating,
  searchImageNoMorePhotos,
  searchImageError
}

class SearchimageState extends Equatable {
  final String query;
  final List<Hit> images;
  final ImagesStatus status;
  final Failure failure;

  const SearchimageState({
    @required this.query,
    @required this.images,
    @required this.status,
    @required this.failure,
  });

  factory SearchimageState.initial() {
    return SearchimageState(
      query: '',
      images: [],
      status: ImagesStatus.searchImageInitial,
      failure: null,
    );
  }

  @override
  List<Object> get props => [query, images, status, failure];

  @override
  bool get stringify => true;

  SearchimageState copyWith({
    String query,
    List<Hit> images,
    ImagesStatus status,
    Failure failure,
  }) {
    return SearchimageState(
        query: query ?? this.query,
        images: images ?? this.images,
        status: status ?? this.status,
        failure: failure ?? this.failure);
  }
}
