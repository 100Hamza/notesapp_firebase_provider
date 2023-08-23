import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/onboarding/layout/onboarding_body.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
