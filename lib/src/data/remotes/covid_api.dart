import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:thailand_covid_flutter_app/src/config/api_url.dart';
import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';

abstract class CovidApi {
  Future<TodayCasesModel> getTodayCases();
  Future<String> getTimeline();
  Future<String> getSumCases();
}

class CovidApiImpl implements CovidApi {

  InterceptedClient _client;

  CovidApiImpl(this._client);

  @override
  Future<String> getSumCases() {
    // TODO: implement getSumCases
    throw UnimplementedError();
  }

  @override
  Future<String> getTimeline() {
    // TODO: implement getTimeline
    throw UnimplementedError();
  }

  @override
  Future<TodayCasesModel> getTodayCases() async {
    var todayCasesModel;
    try {
      final response =
      await _client.get(
          Uri.parse(THAILAND_COVID_BASE_URL + THAILAND_COVID_TODAY_CASE_PATH));
      if (response.statusCode == 200) {
        todayCasesModel =  TodayCasesModel.fromJson(jsonDecode(response.body));
      } else {
        return Future.error(
          "Error while fetching.",
          StackTrace.fromString("${response.body}"),
        );
      }
    } on SocketException {
      return Future.error('No Internet connection 😑');
    } on FormatException {
      return Future.error('Bad response format 👎');
    } on Exception catch (error) {
      print(error);
      return Future.error('Unexpected error 😢');
    }
    return todayCasesModel;
  }

}