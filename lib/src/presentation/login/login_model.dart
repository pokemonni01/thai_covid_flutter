import 'package:thailand_covid_flutter_app/src/common/base_model.dart';
import 'package:thailand_covid_flutter_app/src/common/view_state.dart';


class LoginModel extends BaseModel {

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
