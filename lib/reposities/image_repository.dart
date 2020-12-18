import 'package:hp_wallpaper/service/image_api_provider.dart';

class ImageRepository {
  final imageApi = ImageApiProvider();


  Future getImages(String imageType) => imageApi.getImages(imageType: imageType);
}

