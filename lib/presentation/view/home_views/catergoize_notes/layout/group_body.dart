import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/utils/utils.dart';

import '../../../../../ui_config/front_end_config.dart';
import '../../../../elements/custom_text.dart';
import '../../../../model/catergory_model.dart';

class GroupBody extends StatefulWidget {
  const GroupBody({Key? key}) : super(key: key);

  @override
  State<GroupBody> createState() => _GroupBodyState();
}
bool _isLoading = false;
CardList list = CardList();

List<int> categoryCount = [ 0 , 0 , 0 , 0];
class _GroupBodyState extends State<GroupBody> {
  @override
  Widget build(BuildContext context) {
    final categoryCount = FirebaseFirestore.instance.collection('Notes').snapshots();
    final userID = FirebaseAuth.instance.currentUser!.uid;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20),
          child: Container(
              alignment: Alignment.centerLeft,
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: CustomText(
                text: 'Groups',
                textColor: FrontEndConfig.kCategoryTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              )),
        ),
        Expanded(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: StreamBuilder<QuerySnapshot<Map<String ,dynamic>>>(
              stream: categoryCount,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                  {}

                if(snapshot.hasData)
                  {
                    List<DocumentSnapshot> categoryDocs = snapshot.data!.docs;
                    return GridView.builder(
                      itemCount: list.cardsIcon.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        DocumentSnapshot categoryDoc = categoryDocs[index];
                        String categoryName = categoryDoc['group'];
                        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection('Notes')
                                .where('group', isEqualTo: categoryName).where('userId', isEqualTo: userID)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting)
                              {
                              }
                              if(snapshot.hasData)
                                {
                                  int noteCount = snapshot.data!.docs.length;
                                  return InkWell(
                                    onTap: () {
                                      // Navigator.of(context).pushAndRemoveUntil(
                                      //     MaterialPageRoute(builder: (context) => HomeBody(groupName: list.cardsIcon[index].cardName,)),
                                      //         (Route<dynamic> route) => false);
                                      // NavigationHelper.pushRoute(context, HomeBody(groupName: list.cardsIcon[index].cardName));
                                      Utils().toastMessage(noteCount.toString(),);
                                    },
                                    child: Material(
                                      elevation: 15,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: list.cardsIcon[index].color,
                                                  borderRadius: BorderRadius.circular(50)),
                                              child: list.cardsIcon[index].cardIcon,
                                            ),
                                            CustomText(
                                              text: list.cardsIcon[index].cardName.toString(),
                                              fontSize: 17.0,
                                            ),
                                            CustomText(
                                              // text: categoryCount[index].toString(),
                                              text: noteCount.toString(),
                                              textColor:
                                              FrontEndConfig.kGroupCardsNotesCountColor,
                                              fontSize: 12,
                                            ),
                                            CustomText(
                                              text: "Notes",
                                              textColor:
                                              FrontEndConfig.kGroupCardsNotesCountColor,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              return Text('');
                            }
                        );
                      },
                    );
                  }
                return Text('');

              }
            ),
          ),
        )
      ],
    );
  }
}
