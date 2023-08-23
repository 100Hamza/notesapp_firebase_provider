import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';


class GroupCardsModel
{
  Icon? cardIcon;
  Color? color;
  String? cardName;
  GroupCardsModel({required this.cardIcon,  required this.cardName , this.color});
}

class CardList{
  List<GroupCardsModel> cardsIcon = [
    GroupCardsModel(cardIcon: const Icon(Icons.person , color: Color(0xFFFFD800), size: 50), cardName: "Personal" ,color: FrontEndConfig.kPersonalCardIconBGColor),
    GroupCardsModel(cardIcon:  const Icon(Icons.work_history_outlined , color: Color(0xFF36D830), size: 50,), cardName: "Work" , color: FrontEndConfig.kWorkCardIconBGColor),
    GroupCardsModel(cardIcon: const Icon(Icons.meeting_room , color: Color(0xFFFF0034) , size: 50,), cardName: "Meeting" , color: FrontEndConfig.kShoppingCardIconBGColor),
    GroupCardsModel(cardIcon: const Icon(Icons.shopping_bag_outlined , color: Color(0xFF36D830), size: 50,), cardName: "Shopping" , color: FrontEndConfig.kWorkCardIconBGColor),
  ];
}