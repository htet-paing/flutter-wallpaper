import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'package:hp_wallpaper/ui/screens/screens.dart';

class ImageItem extends StatelessWidget {
  final Hit image;
  ImageItem(this.image);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ImageScreen(image: image)
          )
        );
      },
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.grey,
        child: Hero(
          tag: image.webformatURL,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: CachedNetworkImage(
              imageUrl: image.webformatURL,
              // imageUrl: 'https://cdn.pixabay.com/photo/2016/11/29/03/35/beautiful-1867092_960_720.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}