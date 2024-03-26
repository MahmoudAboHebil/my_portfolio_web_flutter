import 'dart:async';

import 'package:abohebil_portfolio/presentation/routing/route_names.dart';

import '../../locator.dart';

StreamController<int> streamController = StreamController<int>.broadcast();
int getCurrentWidget() {
  String currentPage = locator<NavigationService>().currentRoute;
  if (currentPage == HomeRoute) {
    return 0;
  } else if (currentPage == AboutRoute) {
    return 1;
  } else if (currentPage == ServiceRoute) {
    return 2;
  } else if (currentPage == PortfolioRoute) {
    return 3;
  } else if (currentPage == ContactRoute) {
    return 4;
  } else {
    return 3;
  }
}

class NavigationService {
  String currentRoute = HomeRoute;
  void navigatorTo(String routeName) {
    currentRoute = routeName;
  }
}
