import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:notesapp_firebase_provider/navigation_helper/navigation_helper.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_button.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_textf_field.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/login_view.dart';
import 'package:notesapp_firebase_provider/provider/auth/registration_provider.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';
import 'package:provider/provider.dart';
import '../../widget/custom_rich_text.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

TextEditingController _userNameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _mailController = TextEditingController();
bool isLoading = false;
class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return LoadingOverlay(
      isLoading: registrationProvider.getLoading,
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
                  controller: _userNameController,
                  hint: 'Enter User Name',
                  iconData: Icons.person,
                )),
            CustomTextField(
              controller: _mailController,
              hint: "Enter Email",
              iconData: Icons.mail,
            ),
            CustomTextField(
              controller: _passwordController,
              hint: "Enter Password",
              iconData: Icons.lock,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                buttonTitle: "Signup",
                color: FrontEndConfig.kButtonColor,
                onPressed: () {
                  if(_userNameController.text.isEmpty || _mailController.text.isEmpty || _passwordController.text.isEmpty)
                  {
                    Utils().toastMessage("Each Field must be filled");
                  }
                  else
                  {
                    registrationProvider.register(context: context,email: _mailController.text, pass: _passwordController.text, userNameClear: _userNameController , emailClear: _mailController , passwordClear: _passwordController);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            CustomRichText(
              firstText: 'Already Have an Account',
              secondText: ' Login',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  NavigationHelper.pushRoute(context, LoginView());
                },
            ),
          ],
        ),
      ),
    );
  }

}
