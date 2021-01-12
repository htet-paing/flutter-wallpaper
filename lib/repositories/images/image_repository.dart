import 'dart:convert';
import 'package:hp_wallpaper/config/api_key.dart';
import 'package:hp_wallpaper/config/base_url.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:http/http.dart' as http;
import '../repositories.dart';

class ImageRepository extends BaseImagesRepository {
  final http.Client _httpClient;

  static const int perPage = 20;

  ImageRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  void dispose() {
    _httpClient.close();
  }

  @override
  Future<List<Hit>> getImages({String imageType}) async {
    var url = baseUrl +
        '?key=$apiKey&per_page=25&editors_choice=true&orientation=vertical&image_type=$imageType';
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> imageJson = data['hits'];
        final List<Hit> images = imageJson.map((i) => Hit.fromJson(i)).toList();
        return images;
      }
    } catch (e) {
      throw Exception();
    }

    throw UnimplementedError();
  }

  @override
  Future<List<Hit>> searchImages({String query, int page = 1}) async {
    var url = baseUrl +
        '?key=$apiKey&page=$page&per_page=$perPage&editors_choice=true&orientation=vertical&q=$query';
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> imageJson = data['hits'];
        final List<Hit> images = imageJson.map((i) => Hit.fromJson(i)).toList();
        return images;
      }
    } catch (e) {
      throw Exception();
    }
    throw UnimplementedError();
  }
}
