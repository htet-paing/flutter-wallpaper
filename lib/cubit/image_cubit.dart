import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/reposities/image_repository.dart';
import 'package:meta/meta.dart';
part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageRepository _repository;
  ImageCubit(this._repository) : super(ImageInitial());

  Future<void> getImages(String imageType) async {
    try {
      emit(ImageLoadingState());
      final images = await _repository.getImages(imageType);
      emit(ImageLoadedState(images: images));
    } catch (e) {
      emit(ImageErrorState(message: e.toString()));
    }
  }
}
