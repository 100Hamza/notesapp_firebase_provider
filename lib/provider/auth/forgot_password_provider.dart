import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:notesapp_firebase_provider/navigation_helper/navigation_helper.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/login_view.dart';


class ForgotPasswordProvider with ChangeNotifier
{
  final auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get getLoadingValue => _isLoading;

  void setLoadingValue(bool isLoading)
  {
    _isLoading = isLoading;
    notifyListeners();
  }

  void forgotPassword({required BuildContext context , required String email}) async {
    setLoadingValue(true);
    try{
      await auth.sendPasswordResetEmail(email: email).then((value) {
        setLoadingValue(false);
        Utils().toastMessage('The mail have been sent to your email. Kindly check your inbox or spam.');
        Navigator.pop(context);
      });
    }
    catch(e)
    {
      setLoadingValue(false);
      Utils().toastMessage(e.toString());
    }
  }

}