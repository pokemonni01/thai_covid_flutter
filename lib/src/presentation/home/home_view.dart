import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thailand_covid_flutter_app/src/common/base_view.dart';
import 'package:thailand_covid_flutter_app/src/common/view_state.dart';
import 'package:thailand_covid_flutter_app/src/presentation/home/home_model.dart';

class HomeView extends StatelessWidget {

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getTodayCase();
      },
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                await model.getTodayCase();
              },
            )
          ],
        ),
      ),
    );
  }
}
