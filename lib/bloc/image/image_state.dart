part of 'image_cubit.dart';

@immutable
abstract class ImageState extends Equatable{
  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {
  
}

class ImageLoadingState extends ImageState {}

class ImageLoadedState extends ImageState {
  final List<Hit> images;
  ImageLoadedState({@required this.images});
  @override
  List<Object> get props => [images];
}

class ImageErrorState extends ImageState {
  final String message;
  ImageErrorState({@required this.message});
}