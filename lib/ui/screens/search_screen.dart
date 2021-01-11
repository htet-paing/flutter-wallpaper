import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_wallpaper/bloc/searchImage/searchimage_bloc.dart';
import 'package:hp_wallpaper/ui/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SearchImgeBox(),
            Expanded(
              child: BlocBuilder<SearchimageBloc, SearchimageState>(
                builder: (context, state) {
                  if (state is SearchimageInitial) {
                    return Container();
                  } else if (state is SearchImageLoading) {
                    return loading();
                  } else if (state is SearchImageLoaded) {
                    return ImageList(state.images);
                   
                  } else if (state is SearchImageError) {
                    return NetworkError();
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
