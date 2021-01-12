import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hp_wallpaper/model/image_model.dart';
import 'widgets.dart';

class ImageList extends StatelessWidget {
  final List<Hit> images;
  final ScrollController controller;
  ImageList({this.images, this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: 4,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageItem(images[index]);
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
