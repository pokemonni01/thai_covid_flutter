import 'package:thailand_covid_flutter_app/src/common/locator.dart';
import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';
import 'package:thailand_covid_flutter_app/src/domain/repositories/thailand_covid_data_repository.dart';

abstract class TodayCaseUseCase {
  Future<TodayCasesModel> getTodayCases();
}

class TodayCaseUseCaseImpl implements TodayCaseUseCase {

  ThailandCovidDataRepository _repo = locator<ThailandCovidDataRepository>();

  TodayCaseUseCaseImpl(this._repo);

  @override
  Future<TodayCasesModel> getTodayCases() async {
    return _repo.getTodayCases();
  }

}