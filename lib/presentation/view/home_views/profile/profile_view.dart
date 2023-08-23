import 'package:flutter/material.dart';

import '../../../../ui_config/front_end_config.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Profile'), backgroundColor: FrontEndConfig.kButtonColor),
    );
  }
}
