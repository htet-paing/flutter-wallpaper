import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_wallpaper/bloc/image/image_cubit.dart';

class ImageTabScreen extends StatefulWidget {
  @override
  _ImageTabScreenState createState() => _ImageTabScreenState();
}

class _ImageTabScreenState extends State<ImageTabScreen> {
  int activeIndex = 0;
  ImageCubit imageCubit;
  @override
  Widget build(BuildContext context) {
    imageCubit = BlocProvider.of<ImageCubit>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[        
          tab(0, "Photo", "photo"),
          tab(1, "Illustrations", "illustrations"),
          tab(2, "Vectors", "vectors"),
        ],
      ),
    );
  }

  Widget tab(int index, String title, String imageType) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, 
      vertical: 15.0),
      child: InkWell(
        onTap: () {
          imageCubit.getImages(imageType);
          setState(() {
            activeIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: activeIndex == index ? Colors.redAccent : Color(0xFF333333)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                color: activeIndex == index ? Colors.white : Color(0xFF999999),
              ),
            ),
          ),
        ),
      ),
    );
  }
}