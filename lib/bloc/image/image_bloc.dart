import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/reposities/image_repository.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageRepository repository;
  ImageBloc({@required this.repository}) : super(ImageInitial());

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is FetchImageEvent) {
      yield ImageLoadingState();
      try {
        List<Hit> images = await repository.getImages(event.imageType);
        yield ImageLoadedState(images: images);
      }catch (e) {
        yield ImageErrorState(message: e.toString());
      }
    }
  }
}
