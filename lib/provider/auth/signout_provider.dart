import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/login_view.dart';

class SignOutProvider with ChangeNotifier{

  final auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get getLoading => _isLoading;

  void setLoading (bool isLoading)
  {
    _isLoading = isLoading;
    notifyListeners();
  }

  void signingOut(BuildContext context) async{
    setLoading(true);
    try{
      await auth.signOut().whenComplete((){
        setLoading(false);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginView(),), (route) => false);
      });
    }
    catch(e)
    {
      setLoading(false);
      Utils().toastMessage('Error: ${e.toString()}');
    }

  }

}