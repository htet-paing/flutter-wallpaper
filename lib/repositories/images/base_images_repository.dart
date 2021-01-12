import 'package:hp_wallpaper/model/image_model.dart';
import '../repositories.dart';

abstract class BaseImagesRepository extends BaseRepository {
  Future<List<Hit>> getImages({String imageType});

  Future<List<Hit>> searchImages({String query, int page});
}
