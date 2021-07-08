import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';

abstract class ThailandCovidDataRepository {
  Future<TodayCasesModel> getTodayCases();
  Future<String> getTimeline();
  Future<String> getSumCases();
}