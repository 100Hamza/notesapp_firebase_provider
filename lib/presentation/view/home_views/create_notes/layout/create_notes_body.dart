import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_text.dart';
import 'package:notesapp_firebase_provider/presentation/elements/custom_textf_field.dart';
import 'package:notesapp_firebase_provider/provider/add_notes_provider.dart';
import 'package:notesapp_firebase_provider/provider/dropdown_provider.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/bottom_nav_provider.dart';
import '../../../../utils/utils.dart';

class CreateNotesBody extends StatefulWidget {
  const CreateNotesBody({Key? key}) : super(key: key);

  @override
  State<CreateNotesBody> createState() => _CreateNotesBodyState();
}

TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

class _CreateNotesBodyState extends State<CreateNotesBody> {
  @override
  Widget build(BuildContext context) {
    final dropDownProvider = Provider.of<DropDownProvider>(context);
    final bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    final addNotesProvider = Provider.of<AddNotesProvider>(context);

    var groupName = ['Personal', 'Work', 'Meeting', 'Shopping'];
    return LoadingOverlay(
      isLoading: addNotesProvider.getLoaderValue,
      child: Column(
          children: [
          Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          height: MediaQuery
              .of(context)
              .size
              .height * .11,
          color: FrontEndConfig.kButtonColor,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text('Add Notes',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          InkWell(
          onTap: () {
            if (_titleController.text.isEmpty ||
                _descriptionController.text.isEmpty) {
              Utils().toastMessage('Fields can\'t be empty');
            }
            else {
              addNotesProvider.addNotes(context: context,
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                  group: dropDownProvider.getGroupValue);
              if((addNotesProvider.getIsComplete) == true)
                {
                  bottomNavigationProvider.setIndex(0);
                  print('Is Complete Value ${addNotesProvider.getIsComplete}');
                  addNotesProvider.setIsComplete(false);
                  print('After Complete Value ${addNotesProvider.getIsComplete}');
                }

            }},
            child:
            Icon(Icons.cloud_upload, size: MediaQuery
                .of(context)
                .size
                .height * 0.035, color: Colors.white,)
          )
      // SizedBox(width: 10,)
      ],
      ),
      ),
      Column(
      children: [
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
      child: Row(
      children: [
      Expanded(
      child: CustomTextField(
      controller: _titleController,
      hint: 'Title',
      isIcons: false,
      fontWeight: FontWeight.bold,
      fontSize: 22.0,
      fontColor: FrontEndConfig.kNoteTitle,
      isBorder: false),
      ),
      DropdownButton(
      value: dropDownProvider.getGroupValue,
      items: groupName.map((String items) {
      return DropdownMenuItem(
      value: items,
      child: Text(items),
      );
      }).toList(),
      onChanged: (String? newValue) {
      dropDownProvider.setGroupValue(newValue!);
      }),
      ],
      ),
      ),
      CustomText(
      text: DateTime.now().toString(),
      textColor: FrontEndConfig.kNotesTime,
      ),
      CustomTextField(
      controller: _descriptionController,
      hint: 'Type Something.....',
      isIcons: false,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      fontColor: FrontEndConfig.kNoteTitle,
      isBorder: false,
      maxLines: 10),
      ],
      ))
      ],
      ),
      ]
      ,
      ),
    );
  }
  }
