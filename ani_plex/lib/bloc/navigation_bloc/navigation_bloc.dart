import 'package:aniplex/shared/homepage.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  /*LoginClickedEvent,
  AnimeClickedEvent,
  MangaClickedEvent,
  SettingsClickedEvent,
  LogoutClickedEvent*/
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
      break;
      /*case NavigationEvents.LoginClickedEvent:
        yield null;
      break;
      case NavigationEvents.AnimeClickedEvent:
        yield null;
      break;
      case NavigationEvents.MangaClickedEvent:
        yield null();
      break;
      case NavigationEvents.SettingsClickedEvent:
        yield null;
      break;
      case NavigationEvents.LogoutClickedEvent:
        yield null;
      break;*/
    }
  }

}