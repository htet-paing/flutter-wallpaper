part of 'image_bloc.dart';

@immutable
abstract class ImageEvent extends Equatable{}

class FetchImageEvent extends ImageEvent {
  final String imageType;
  FetchImageEvent({@required this.imageType});
  @override
  List<Object> get props => [imageType];

}