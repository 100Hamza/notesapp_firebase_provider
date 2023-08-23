import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_button.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/login_view.dart';
import 'package:notesapp_firebase_provider/ui_config/constants.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';

import '../../../../navigation_helper/navigation_helper.dart';
import '../../../elements/custom_text.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Image.asset('assets/images/logo.png', height: md.height * 0.4 , width: md.width*0.4,)),
          Flexible(child: CustomText(text: "Made it Simple ",textColor: FrontEndConfig.kOnBoardingFirstTextColor, fontSize: 22, )),
          const SizedBox(height: 10,),
          CustomText(text: Constants.onBoardingText ,textColor: FrontEndConfig.kOnBoardingSecondTextColor, fontSize: 17, textAlign: TextAlign.center),
          const SizedBox(height: 20,),
          CustomButton(buttonTitle: "Get Started",  color: FrontEndConfig.kButtonColor , onPressed: (){
            NavigationHelper.pushRoute(context, const LoginView());
          }),
        ],
      ),
    );
  }
}
