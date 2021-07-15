import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thailand_covid_flutter_app/src/common/base_view.dart';
import 'package:thailand_covid_flutter_app/src/common/view_state.dart';
import 'package:thailand_covid_flutter_app/src/domain/entities/today_cases_model.dart';
import 'package:thailand_covid_flutter_app/src/presentation/home/home_model.dart';

class HomeView extends StatelessWidget {

  static String routeName = "/home";

  Widget topSection(String updateDate) => Container(
        child: Column(
          children: [
            Text(
              "สถานะการณ์ COVID-19 ในประเทศไทย",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "ข้อมูลวันที่ $updateDate",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );

  Widget newConfirmSection(int newConfirmCases) => Expanded(
        child: Container(
          height: 200.0,
          color: Colors.red,
          child: Column(
            children: [
              Text("ผู้ติดเชื้อเพิ่มวันนี้"),
              Text("+$newConfirmCases")
            ],
          ),
        ),
      );

  Widget confirmSection(int confirmCases) => Expanded(
        child: Container(
          height: 200.0,
          color: Colors.red.shade900,
          child: Column(
            children: [Text("ผู้ป่วยสะสม"), Text("$confirmCases")],
          ),
        ),
      );

  Widget recoveredSection(int recoveredCase) => Expanded(
        child: Container(
          height: 200.0,
          color: Colors.green,
          child: Column(
            children: [Text("หายป่วยสะสม"), Text("$recoveredCase")],
          ),
        ),
      );

  Widget newRecoveredSection(int newRecoveredCase) => Expanded(
        child: Container(
          height: 200.0,
          color: Colors.green.shade900,
          child: Column(
            children: [Text("หายป่วยกลับบ้าน"), Text("$newRecoveredCase")],
          ),
        ),
      );

  Widget deathSection(int newDeaths) => Expanded(
        child: Container(
          height: 200.0,
          color: Colors.black,
          child: Column(
            children: [Text("เสียชีวิตเพิ่มวันนี้"), Text("$newDeaths")],
          ),
        ),
      );

  Widget bodySection(TodayCasesModel model) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            newConfirmSection(model.newConfirmed),
            confirmSection(model.confirmed),
            recoveredSection(model.recovered),
            deathSection(model.newDeaths),
            newRecoveredSection(model.newRecovered)
          ],
        ),
      );

  Widget get bottomSection => Container(
        height: 100.0,
        color: Colors.blueAccent,
        child: Text("แหล่งอ้างอิง Google.com"),
      );

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getTodayCase();
      },
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.lightBlue.shade900,
              body: model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : Column(
                children: [
                  topSection(model.todayCasesModel.updateDate),
                  bodySection(model.todayCasesModel),
                  bottomSection
                ],
              ),
            ),
          ),
    );
  }
}
