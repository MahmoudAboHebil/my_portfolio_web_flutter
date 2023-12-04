import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';
import 'package:portfolio_2/sections/contact_section/contact_section.dart';
import 'package:portfolio_2/sections/details_section/details_section.dart';
import 'package:portfolio_2/sections/home_section/home_section.dart';
import 'package:portfolio_2/sections/service_section/service_section.dart';

import '../sections/portfolio_section/portfolio_section.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('###########dd#############');
  print(settings.name);
  PageRoute pageRoute = _FadeRouter(HomeSection(), settings);
  switch (settings.name) {
    case HomeRoute:
      pageRoute = _FadeRouter(HomeSection(), settings);
      break;
    case AboutRoute:
      pageRoute = _FadeRouter(AboutSection(), settings);
      break;
    case PortfolioRoute:
      pageRoute = _FadeRouter(PortfolioSection(), settings);
      break;
    case ServiceRoute:
      pageRoute = _FadeRouter(ServiceSection(), settings);
      break;
    case DetailsRoute:
      pageRoute = _FadeRouter(DetailsSection(), settings);
      break;
    case ContactRoute:
      pageRoute = _FadeRouter(ContactSection(), settings);
      break;

    default:
      pageRoute = _FadeRouter(HomeSection(), settings);
      break;
  }
  return pageRoute;
}

class _FadeRouter extends PageRouteBuilder {
  final Widget child;
  final RouteSettings settings;
  _FadeRouter(this.child, this.settings)
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                child,
            transitionDuration: Duration(seconds: 0),
            settings: settings);
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
    allowSnapshotting: false,
  );
}
