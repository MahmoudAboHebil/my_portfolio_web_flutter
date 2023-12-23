import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:portfolio_2/models/protfolio_projects.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';
import 'package:portfolio_2/sections/contact_section/contact_section.dart';
import 'package:portfolio_2/sections/details_section/details_section.dart';
import 'package:portfolio_2/sections/home_section/home_section.dart';
import 'package:portfolio_2/sections/service_section/service_section.dart';

import '../sections/portfolio_section/portfolio_section.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: HomeRoute,
      page: () => HomeSection(),
    ),
    GetPage(
      name: AboutRoute,
      page: () => AboutSection(),
    ),
    GetPage(
      name: PortfolioRoute,
      page: () => PortfolioSection(),
    ),
    GetPage(
      name: ServiceRoute,
      page: () => ServiceSection(),
    ),
    GetPage(
      name: DetailsRoute_0,
      page: () => DetailsSection(
        projectName: projects[0].projectName,
        gitHupLink: projects[0].gitHupLink,
        description: projects[0].description,
        data: projects[0].data,
        cartImageURL: projects[0].cartImageURL,
        images: projects[0].imagesURLs,
        technology: projects[0].technology,
      ),
    ),
    GetPage(
      name: DetailsRoute_1,
      page: () => DetailsSection(
        projectName: projects[1].projectName,
        gitHupLink: projects[1].gitHupLink,
        description: projects[1].description,
        data: projects[1].data,
        cartImageURL: projects[1].cartImageURL,
        images: projects[1].imagesURLs,
        technology: projects[1].technology,
      ),
    ),
    GetPage(
      name: DetailsRoute_2,
      page: () => DetailsSection(
        projectName: projects[2].projectName,
        gitHupLink: projects[2].gitHupLink,
        description: projects[2].description,
        data: projects[2].data,
        cartImageURL: projects[2].cartImageURL,
        images: projects[2].imagesURLs,
        technology: projects[2].technology,
      ),
    ),
    GetPage(
      name: DetailsRoute_3,
      page: () => DetailsSection(
        projectName: projects[3].projectName,
        gitHupLink: projects[3].gitHupLink,
        description: projects[3].description,
        data: projects[3].data,
        cartImageURL: projects[3].cartImageURL,
        images: projects[3].imagesURLs,
        technology: projects[3].technology,
      ),
    ),
    GetPage(
      name: DetailsRoute_4,
      page: () => DetailsSection(
        projectName: projects[4].projectName,
        gitHupLink: projects[4].gitHupLink,
        description: projects[4].description,
        data: projects[4].data,
        cartImageURL: projects[4].cartImageURL,
        images: projects[4].imagesURLs,
        technology: projects[4].technology,
      ),
    ),
    GetPage(
      name: ContactRoute,
      page: () => ContactSection(),
    ),
  ];
}

// ############################################
// Route<dynamic> generateRoute(RouteSettings settings) {
//   print('###########dd#############');
//   print(settings.name);
//   PageRoute pageRoute = _FadeRouter(HomeSection(), settings);
//   switch (settings.name) {
//     case HomeRoute:
//       pageRoute = _FadeRouter(HomeSection(), settings);
//       break;
//     case AboutRoute:
//       pageRoute = _FadeRouter(AboutSection(), settings);
//       break;
//     case PortfolioRoute:
//       pageRoute = _FadeRouter(PortfolioSection(), settings);
//       break;
//     case ServiceRoute:
//       pageRoute = _FadeRouter(ServiceSection(), settings);
//       break;
//     case DetailsRoute_0:
//       {
//         pageRoute = _FadeRouter(DetailsSection(), settings);
//         break;
//       }
//     case ContactRoute:
//       pageRoute = _FadeRouter(ContactSection(), settings);
//       break;
//
//     default:
//       pageRoute = _FadeRouter(HomeSection(), settings);
//       break;
//   }
//   return pageRoute;
// }
//
// class _FadeRouter extends PageRouteBuilder {
//   final Widget child;
//   final RouteSettings settings;
//   _FadeRouter(this.child, this.settings)
//       : super(
//             pageBuilder: (BuildContext context, Animation<double> animation,
//                     Animation<double> secondaryAnimation) =>
//                 child,
//             transitionDuration: Duration(seconds: 0),
//             settings: settings);
// }
//
// PageRoute _getPageRoute(Widget child) {
//   return MaterialPageRoute(
//     builder: (context) => child,
//     allowSnapshotting: false,
//   );
// }
