import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hp_wallpaper/model/failure_model.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/repositories/images/image_repository.dart';

part 'searchimage_event.dart';
part 'searchimage_state.dart';

class SearchimageBloc extends Bloc<SearchimageEvent, SearchimageState> {
  final ImageRepository _imageRepository;
  SearchimageBloc({@required ImageRepository imageRepository})
      : _imageRepository = imageRepository,
        super(SearchimageState.initial());

  @override
  Future<void> close() {
    _imageRepository.dispose();
    return super.close();
  }

  @override
  Stream<SearchimageState> mapEventToState(
    SearchimageEvent event,
  ) async* {
    if (event is SearchImages) {
      yield* _mapImagesSearchImagesToState(event);
    } else if (event is ImagesPaginate) {
      yield* _mapImagesPaginateToState();
    }
  }

  Stream<SearchimageState> _mapImagesSearchImagesToState(
      SearchImages event) async* {
    yield state.copyWith(
        query: event.query, status: ImagesStatus.searchImageLoading);
    try {
      final images = await _imageRepository.searchImages(query: event.query);
      yield state.copyWith(
          images: images, status: ImagesStatus.searchImageLoaded);
    } catch (error) {
      print(error);
      yield state.copyWith(
          failure: Failure(
            message: 'Something went wrong! Please try a different search',
          ),
          status: ImagesStatus.searchImageError);
    }
  }

  Stream<SearchimageState> _mapImagesPaginateToState() async* {
    yield state.copyWith(status: ImagesStatus.searchImagePaginating);

    final images = List<Hit>.from(state.images);
    List<Hit> nextImages = [];
    if (images.length >= ImageRepository.perPage) {
      nextImages = await _imageRepository.searchImages(
          query: state.query,
          page: state.images.length ~/ ImageRepository.perPage + 1);
    }
    yield state.copyWith(
        images: images..addAll(nextImages),
        status: nextImages.isNotEmpty
            ? ImagesStatus.searchImageLoaded
            : ImagesStatus.searchImageNoMorePhotos);
  }
}
