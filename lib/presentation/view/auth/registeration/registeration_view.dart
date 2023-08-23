import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/registeration/layout/registeration_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterBody(),);
  }
}
