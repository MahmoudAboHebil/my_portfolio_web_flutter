import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_2/data/repository/data_repo.dart';
import 'package:portfolio_2/logic/cubit_data/cubit_projects.dart';
import 'package:portfolio_2/logic/cubit_data/cubit_data_state.dart';
import 'firebase_options.dart';
import 'package:portfolio_2/locator.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/routing/router.dart';
import 'package:portfolio_2/services/navigtion_service.dart';
import 'package:get/get.dart' as gett;

import 'constants.dart';
import 'home_page.dart';

void main() async {
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(RR());
}

class RR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DataRepository>(
      create: (context) => DataRepository(),
      child: BlocProvider<CubitData>(
        create: (context) =>
            CubitData(firRepo: RepositoryProvider.of<DataRepository>(context)),
        child: BlocBuilder<CubitData, CubitDataState>(
          builder: (context, state) {
            if (state is LoadedData) {
              return gett.GetMaterialApp.router(
                theme: ThemeData(
                    inputDecorationTheme: kDefaultInputDecorationTheme,
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                    scrollbarTheme: ScrollbarThemeData(
                        thumbVisibility: MaterialStateProperty.all(true),
                        thickness: MaterialStateProperty.all(10),
                        radius: const Radius.circular(10),
                        minThumbLength: 100)),
                builder: (context, child) {
                  return HomePage(child!);
                },
                debugShowCheckedModeBanner: false,
                defaultTransition: gett.Transition.fade,
                getPages: AppPages.pages,
                routerDelegate: AppRouterDelegate(),
              );
            }
            return MyApp();
          },
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppRouterDelegate extends gett.GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        return route.didPop(result);
      },
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [gett.GetNavConfig.fromRoute(HomeRoute)!.currentPage!],
    );
  }
}
