import 'package:flutter/material.dart';

import '../forgot_password/bodyPage.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Login Success"),
      ),
      body: BodyPage(),
    );
  }
}
