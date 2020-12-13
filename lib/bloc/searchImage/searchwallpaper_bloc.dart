import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searchwallpaper_event.dart';
part 'searchwallpaper_state.dart';

class SearchwallpaperBloc extends Bloc<SearchwallpaperEvent, SearchwallpaperState> {
  SearchwallpaperBloc() : super(SearchwallpaperInitial());

  @override
  Stream<SearchwallpaperState> mapEventToState(
    SearchwallpaperEvent event,
  ) async* {
    
  }
}
