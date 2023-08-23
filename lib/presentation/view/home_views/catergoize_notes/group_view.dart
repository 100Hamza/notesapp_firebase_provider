import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/home_views/catergoize_notes/layout/group_body.dart';
import 'package:notesapp_firebase_provider/presentation/view/home_views/catergoize_notes/widget/custom_appbar.dart';
import 'package:notesapp_firebase_provider/provider/auth/signout_provider.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';
import 'package:provider/provider.dart';

class GroupView extends StatelessWidget {
  const GroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signOutProvider = Provider.of<SignOutProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context, () {
          signOutProvider.signingOut(context);

        }),
        body: const GroupBody(),
        // body: Center(
        //   child: Container(
        //     child: signOutProvider.getLoading?const CircularProgressIndicator(backgroundColor: Colors.white , color: FrontEndConfig.kCategoryTextColor, strokeWidth: 6): const Text('Hello is has not been signnout'),
        //   ),
        // ),
      ),
    );
  }
}
