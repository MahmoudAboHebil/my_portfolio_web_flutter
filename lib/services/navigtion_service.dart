import 'dart:async';

import 'package:portfolio_2/routing/route_names.dart';

StreamController<int> streamController = StreamController<int>.broadcast();

class NavigationService {
  String currentRoute = HomeRoute;
  void navigatorTo(String routeName) {
    currentRoute = routeName;
  }
}
