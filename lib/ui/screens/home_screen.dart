import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_wallpaper/bloc/image/image_cubit.dart';
import 'package:hp_wallpaper/ui/widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(
          Icons.menu, 
          color: Colors.white,
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text('HPwallpaper',style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          letterSpacing: 0.3,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchScreen()
                )
              );
            },
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ImageTabScreen(),
            Expanded(
              child: BlocBuilder<ImageCubit, ImageState>(        
                  builder: (context, state){
                  if (state is ImageInitial){
                    return loading();
                  }else if (state is ImageLoadingState){
                    return loading();
                  }else if (state is ImageLoadedState){
                    return ImageList(images: state.images);
                  }else if (state is ImageErrorState){
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