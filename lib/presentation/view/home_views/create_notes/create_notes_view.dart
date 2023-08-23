import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/home_views/create_notes/layout/create_notes_body.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';

class CreateNotesView extends StatelessWidget {
  const CreateNotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text('Add Notes'), backgroundColor: FrontEndConfig.kButtonColor , actions: const [
      //   Icon(Icons.cloud_upload),
      //   SizedBox(width: 10,)
      // ],
      // ),
      body: CreateNotesBody(),
    );
  }
}
