import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../navigation_helper/navigation_helper.dart';
import '../presentation/utils/utils.dart';
import '../presentation/view/home/home_view.dart';

class AddNotesProvider with ChangeNotifier
{

  final _userID = FirebaseAuth.instance.currentUser!.uid;
  final _docID = FirebaseFirestore.instance.collection('Notes').doc().id;

  bool _loaderValue = false;
  bool _isComplete = false;

  bool get getLoaderValue => _loaderValue;
  bool get getIsComplete => _isComplete;

  void setLoaderValue (bool loader)
  {
    _loaderValue = loader;
    notifyListeners();
  }

  void setIsComplete(bool addNotesDone)
  {
    _isComplete = addNotesDone;
    notifyListeners();
  }

  void addNotes({required BuildContext context , required TextEditingController titleController, required TextEditingController descriptionController, required String group }) async{
    setLoaderValue(true);
    try{
      Map<String , dynamic> addNotesData = {
        "title": titleController.text,
        "description": descriptionController.text,
        "date&Time": DateTime.now(),
        "userId": _userID,
        "docId": _docID,
        "group": group
      };
      await FirebaseFirestore.instance.collection('Notes').doc(_docID).set(addNotesData).then((value) {
        setLoaderValue(false);
        setIsComplete(true);
        Utils().toastMessage('Notes added successfully');
      },);

    }
    catch(e)
    {
      setLoaderValue(false);
      Utils().toastMessage(e.toString());
    }

  }

}