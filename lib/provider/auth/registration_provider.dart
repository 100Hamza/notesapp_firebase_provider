import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:notesapp_firebase_provider/navigation_helper/navigation_helper.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';
import 'package:notesapp_firebase_provider/presentation/view/auth/login/login_view.dart';

class RegistrationProvider with ChangeNotifier{

  final _register = FirebaseAuth.instance;

  bool _isLoading = false;

  bool get getLoading => _isLoading;

  void setLoading(bool loading)
  {
    _isLoading =  loading;
    notifyListeners();
  }

  void register({required BuildContext context, required String email , required String pass, TextEditingController? userNameClear , required TextEditingController passwordClear ,required TextEditingController emailClear}) async{

    setLoading(true);
    try{
      await _register.createUserWithEmailAndPassword(email: email, password: pass).then((value){
        var id = _register.currentUser!.uid;
        setLoading(false);
        passwordClear.clear();
        emailClear.clear();
        userNameClear!.clear();
        Utils().toastMessage('User ID: $id');
        NavigationHelper.pushRoute(context, const LoginView());
      });
    }
    catch(e)
    {
      setLoading(false);
      Utils().toastMessage(e.toString());
    }
  }

}