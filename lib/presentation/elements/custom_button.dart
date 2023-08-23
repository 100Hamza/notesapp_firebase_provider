import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_text.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';


class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  String? buttonTitle;
  Color? color = FrontEndConfig.kButtonColor;

  CustomButton({this.buttonTitle, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Material(
          elevation: 10,
          borderOnForeground: true,
          shadowColor: Color(0xFF1350E0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                color: FrontEndConfig.kButtonColor,
                borderRadius: BorderRadius.circular(10),
            ),
              child: CustomText(text: buttonTitle.toString(), textColor: Colors.white, textAlign: TextAlign.center, fontSize: 17, fontWeight: FontWeight.w500,)),
        ),
      ),
    );
  }
}
