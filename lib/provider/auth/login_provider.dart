import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:notesapp_firebase_provider/navigation_helper/navigation_helper.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/home/home_view.dart';

class LoginProvider with ChangeNotifier{

  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  void setLoading(bool isLoading)
  {
    _isLoading = isLoading;
    notifyListeners();
  }

  void login({required BuildContext context,required String email , required String password , required TextEditingController passwordClear ,required TextEditingController emailClear} ) async{
    setLoading(true);
   try{
     await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
       setLoading(false);
       passwordClear.clear();
       emailClear.clear();
       NavigationHelper.pushRoute(context, const HomeView());
     });

   }
   catch(e)
    {
      setLoading(false);
      Utils().toastMessage(e.toString());
    }

  }

}