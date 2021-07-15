import 'package:flutter/material.dart';
import 'package:thailand_covid_flutter_app/src/common/locator.dart';
import 'package:thailand_covid_flutter_app/src/common/router.dart';
import 'package:thailand_covid_flutter_app/src/presentation/home/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeView.routeName,
      routes: appRoutes,
    );
  }
}
