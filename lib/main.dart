import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:abohebil_portfolio/data/repository/data_repo.dart';
import 'package:abohebil_portfolio/logic/cubitEduAndExp/cubitEduAndExp.dart';
import 'package:abohebil_portfolio/logic/cubit_info/cubit_info.dart';
import 'package:abohebil_portfolio/logic/cubit_path/cubit_path.dart';
import 'package:abohebil_portfolio/logic/cubit_path/cubit_path_state.dart';
import 'package:abohebil_portfolio/logic/cubit_projects/cubit_projects.dart';
import 'package:abohebil_portfolio/presentation/app_colors/app_colors.dart';
import 'package:abohebil_portfolio/presentation/constants/constants.dart';
import 'package:abohebil_portfolio/presentation/home_page.dart';
import 'package:abohebil_portfolio/presentation/routing/route_names.dart';
import 'package:abohebil_portfolio/presentation/routing/router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:abohebil_portfolio/locator.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart' as gett;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  setupLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(RR());
}

class RR extends StatelessWidget {
  final delegate = AppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DataRepository>(
      create: (context) => DataRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CubitPath>(
            create: (context) => CubitPath(
                firRepo: RepositoryProvider.of<DataRepository>(context)),
          ),
          BlocProvider<CubitProjects>(
            create: (context) => CubitProjects(
                firRepo: RepositoryProvider.of<DataRepository>(context)),
          ),
          BlocProvider<CubitInfo>(
            create: (context) => CubitInfo(
                firRepo: RepositoryProvider.of<DataRepository>(context)),
          ),
          BlocProvider<CubitEduAndExp>(
            create: (context) => CubitEduAndExp(
                firRepo: RepositoryProvider.of<DataRepository>(context)),
          ),
        ],
        child: ChangeNotifierProvider<AppColors>(
          create: (context) => AppColors(),
          child: BlocBuilder<CubitPath, CubitPathState>(
            builder: (context, state) {
              if (state is LoadedData) {
                return gett.GetMaterialApp.router(
                  title: 'AboHebil|Portfolio',
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
                    return Overlay(
                      initialEntries: [
                        OverlayEntry(
                          builder: (context) => SelectionArea(
                            child: HomePage(child!),
                          ),
                        )
                      ],
                    );
                  },
                  debugShowCheckedModeBanner: false,
                  defaultTransition: gett.Transition.fade,
                  getPages: AppPages.getProjectsPages(state.paths),
                  routerDelegate: delegate,
                );
              }
              return MyApp();
            },
          ),
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
      title: 'AboHebil|Portfolio',
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
