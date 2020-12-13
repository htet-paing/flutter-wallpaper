import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_wallpaper/reposities/image_repository.dart';
import 'bloc/image/image_bloc.dart';
import 'ui/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (context) => ImageBloc(repository: ImageRepository())..add(FetchImageEvent(imageType: 'photo'))
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HP Wallpaper',
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}