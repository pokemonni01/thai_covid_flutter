import 'package:get_it/get_it.dart';
import 'package:thailand_covid_flutter_app/src/data/repositories/thailand_covid_data_repository_impl.dart';
import 'package:thailand_covid_flutter_app/src/domain/repositories/thailand_covid_data_repository.dart';
import 'package:thailand_covid_flutter_app/src/presentation/login/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Repository
  locator.registerLazySingleton<ThailandCovidDataRepository>(() => ThailandCovidDataRepositoryImpl());

  locator.registerLazySingleton(() => LoginModel());
}