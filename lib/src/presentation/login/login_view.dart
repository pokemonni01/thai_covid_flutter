import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      builder: (context) => locator<LoginModel>,
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: RenderErrorBox.backgroundColor,
          body: Column(children: [

          ],),
        ),
      ),
    );
  }
}
