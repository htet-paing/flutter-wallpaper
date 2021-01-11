import 'dart:convert';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/config/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:hp_wallpaper/config/api_key.dart';

class ImageApiProvider {
  Future getImages({String imageType}) async {
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
  }

  Future searchImages(String query) async {
    var url = baseUrl +
        '?key=$apiKey&per_page=25&editors_choice=true&orientation=vertical&q=$query';
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
  }
}
