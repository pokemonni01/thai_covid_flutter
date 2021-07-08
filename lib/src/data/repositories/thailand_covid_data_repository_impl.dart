import 'dart:convert';

import 'package:thailand_covid_flutter_app/src/config/api_url.dart';
import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';
import 'package:thailand_covid_flutter_app/src/domain/repositories/thailand_covid_data_repository.dart';
import 'package:http/http.dart' as http;

class ThailandCovidDataRepositoryImpl extends ThailandCovidDataRepository {


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
    final response =
    await http.get(Uri.parse(THAILAND_COVID_BASE_URL + THAILAND_COVID_TODAY_CASE_PATH));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return TodayCasesModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}