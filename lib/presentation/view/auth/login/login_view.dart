import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/layout/login_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: LoginBody()
    );
  }
}
