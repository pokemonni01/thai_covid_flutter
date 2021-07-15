
import 'package:http/http.dart' as http;
import 'package:thailand_covid_flutter_app/src/config/api_url.dart';
import 'package:thailand_covid_flutter_app/src/data/remotes/covid_api.dart';
import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';
import 'package:thailand_covid_flutter_app/src/domain/repositories/thailand_covid_data_repository.dart';

class ThailandCovidDataRepositoryImpl extends ThailandCovidDataRepository {

  CovidApi _covidApi;

  ThailandCovidDataRepositoryImpl(this._covidApi);

  @override
  Future<String> getSumCases() async {

    final response =
    await http.get(Uri.parse(THAILAND_COVID_BASE_URL + THAILAND_COVID_TODAY_CASE_PATH));
    throw UnimplementedError();
  }

  @override
  Future<String> getTimeline() async {
    // TODO: implement getTimeline
    throw UnimplementedError();
  }

  @override
  Future<TodayCasesModel> getTodayCases() async {
    return _covidApi.getTodayCases();
  }
}