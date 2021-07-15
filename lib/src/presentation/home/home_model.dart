import 'package:thailand_covid_flutter_app/src/common/base_model.dart';
import 'package:thailand_covid_flutter_app/src/common/locator.dart';
import 'package:thailand_covid_flutter_app/src/common/view_state.dart';
import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';
import 'package:thailand_covid_flutter_app/src/domain/usecases/today_case_use_case.dart';

class HomeModel extends BaseModel {

  TodayCaseUseCase _useCase = locator<TodayCaseUseCase>();

  HomeModel(this._useCase);

  TodayCasesModel todayCasesModel;

  Future<TodayCasesModel> getTodayCase() async {
    setState(ViewState.Busy);
    todayCasesModel = await _useCase.getTodayCases();
    setState(ViewState.Idle);
    return todayCasesModel;
  }
}