import 'package:get_it/get_it.dart';
import 'package:abohebil_portfolio/presentation/routing/navigtion_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
