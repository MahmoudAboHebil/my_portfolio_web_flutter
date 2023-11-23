import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';
import 'package:portfolio_2/sections/home_section/home_section.dart';
import 'package:portfolio_2/sections/service_section/service_section.dart';

import '../sections/portfolio_section/portfolio_section.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  PageRoute pageRoute = _FadeRouter(HomeSection());
  switch (settings.name) {
    case HomeRoute:
      pageRoute = _FadeRouter(HomeSection());
      break;
    case AboutRoute:
      pageRoute = _FadeRouter(AboutSection());
      break;
    case PortfolioRoute:
      pageRoute = _FadeRouter(PortfolioSection());
      break;
    case ServiceRoute:
      pageRoute = _FadeRouter(ServiceSection());
      break;
    default:
      pageRoute = _FadeRouter(HomeSection());
      break;
  }
  return pageRoute;
}

class _FadeRouter extends PageRouteBuilder {
  final Widget child;
  _FadeRouter(this.child)
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                child,
            transitionDuration: Duration(seconds: 0));
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
    allowSnapshotting: false,
  );
}
