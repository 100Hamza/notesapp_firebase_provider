import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:notesapp_firebase_provider/navigation_helper/navigation_helper.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_button.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_text.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_textf_field.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/widget/forgot_password_dialog.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/registeration/registeration_view.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/widget/custom_rich_text.dart';
import 'package:notesapp_firebase_provider/provider/auth/login_provider.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return LoadingOverlay(
      isLoading: loginProvider.getIsLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: Image.asset(
                  'assets/images/login.png',
                  height: 150,
                  width: 150,
                )),
            Flexible(
                child: CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller: _emailController,
              hint: 'Enter Email',
              iconData: Icons.person,
            )),
            CustomTextField(
              controller: _passController,
              hint: 'Enter Password',
              iconData: Icons.lock,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      forgotPasswordDialog(context, title: 'Recover Password', buttonText: 'Yes', message: 'Do you want to recover password?', secondButton: 'No', navigation: (){}, isSecondButton: true);
                    },
                    child: CustomText(
                        text: 'Forget Password',
                        textColor: FrontEndConfig.kButtonColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16))),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonTitle: "Login",
                color: FrontEndConfig.kButtonColor,
                onPressed: () {
                  if (_emailController.text.isEmpty ||
                      _passController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Fields can't be emppty");
                  } else {
                    loginProvider.login(
                        context: context,
                        email: _emailController.text,
                        password: _passController.text,
                        emailClear: _emailController,
                        passwordClear: _passController);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            CustomRichText(
              firstText: 'Don\'t have an Account?',
              secondText: ' SIGNUP',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  NavigationHelper.pushRoute(
                    context,
                    const RegisterView(),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
