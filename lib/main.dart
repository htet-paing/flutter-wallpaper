import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_wallpaper/bloc/searchImage/searchimage_bloc.dart';
import 'bloc/image/image_cubit.dart';
import 'repositories/repositories.dart';
import 'ui/screens/screens.dart';
void main() {
  Bloc.observer = ImageBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ImageRepository(),
          child: MultiBlocProvider(
        providers: [        
          BlocProvider<ImageCubit>(
            create: (context) => ImageCubit(
              imageRepository: context.read<ImageRepository>())..getImages('photo')
          ),
          BlocProvider<SearchimageBloc>(
            create: (context) => SearchimageBloc(
              imageRepository: context.read<ImageRepository>()
            )
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
      ),
    );
  }
}

class ImageBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }
  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}