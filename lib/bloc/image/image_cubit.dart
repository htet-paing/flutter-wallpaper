import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/repositories/repositories.dart';
import 'package:meta/meta.dart';
part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImageRepository _imageRepository;
  ImageCubit({@required ImageRepository imageRepository})
      : _imageRepository = imageRepository,
        super(ImageInitial());

  Future<void> getImages(String imageType) async {
    try {
      emit(ImageLoadingState());
      final images = await _imageRepository.getImages(imageType: imageType);
      emit(ImageLoadedState(images: images));
    } catch (e) {
      emit(ImageErrorState(message: e.toString()));
    }
  }
}
