import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:thailand_covid_flutter_app/src/common/logger_interceptor.dart';
import 'package:thailand_covid_flutter_app/src/data/remotes/covid_api.dart';
import 'package:thailand_covid_flutter_app/src/data/repositories/thailand_covid_data_repository_impl.dart';
import 'package:thailand_covid_flutter_app/src/domain/repositories/thailand_covid_data_repository.dart';
import 'package:thailand_covid_flutter_app/src/domain/usecases/today_case_use_case.dart';
import 'package:thailand_covid_flutter_app/src/presentation/home/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Api Client
  locator.registerLazySingleton<InterceptedClient>(() => InterceptedClient.build(interceptors: [LoggerInterceptor()]));
  locator.registerFactory<CovidApi>(() => CovidApiImpl(locator.get()));

  // Repository
  locator.registerLazySingleton<ThailandCovidDataRepository>(() => ThailandCovidDataRepositoryImpl(locator.get()));

  // Use Case
  locator.registerFactory<TodayCaseUseCase>(() => TodayCaseUseCaseImpl(locator.get()));

  // Model
  locator.registerFactory(() => HomeModel(locator.get()));
}