import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/reposities/image_repository.dart';

part 'searchimage_event.dart';
part 'searchimage_state.dart';

class SearchimageBloc extends Bloc<SearchimageEvent, SearchimageState> {
  final ImageRepository imageRepository;
  SearchimageBloc(this.imageRepository) : super(SearchimageInitial());

  @override
  Stream<SearchimageState> mapEventToState(
    SearchimageEvent event,
  ) async* {
    if (event is SearchImages) {
    yield SearchImageLoading();
      try {
        final images = await imageRepository.searchImages(event.query);
        yield SearchImageLoaded(images: images);
      } catch (e) {
        yield SearchImageError(message: e.toString());
      }
    }
  }
}
