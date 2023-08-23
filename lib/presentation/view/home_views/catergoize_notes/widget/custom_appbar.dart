import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';
import 'package:notesapp_firebase_provider/presentation/view/home_views/catergoize_notes/widget/search_bar.dart';
import 'package:notesapp_firebase_provider/provider/auth/signout_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../ui_config/front_end_config.dart';
import '../../../../elements/navigation_dialog.dart';

PreferredSizeWidget appBar(BuildContext context , VoidCallback onPressed) {
  return PreferredSize(

      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.28), child: Container(
    color: FrontEndConfig.kButtonColor,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width * 5,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/top.png'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SearchBar(
                    hint: 'Search',
                    iconData: Icons.search,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    showNavigationDialog(context,
                        title: "Logout",
                        buttonText: 'Yes',
                        message: 'Do you want to Logout? ',
                        secondButton: "No", navigation: onPressed, isSecondButton: true);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: FrontEndConfig.kButtonColor,
                        borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width * 5,
          color: FrontEndConfig.kButtonColor,
        ),
      ],
    ),
  ));
}
