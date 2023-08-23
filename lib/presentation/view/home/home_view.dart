import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/home_views/create_notes/create_notes_view.dart';
import 'package:notesapp_firebase_provider/presentation/view/home_views/profile/profile_view.dart';
import 'package:notesapp_firebase_provider/provider/bottom_nav_provider.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../../ui_config/front_end_config.dart';
import '../home_views/catergoize_notes/group_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List _pager = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pager = [
      const GroupView(),const CreateNotesView() , const ProfileView(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      bottomNavigationBar: SlidingClippedNavBar(

        // index: 0,
        // height: 60.0,
        // items: const [
        //   Icon(Icons.notes , size: 30, color: Colors.white),
        //   Icon(Icons.add, size: 30, color: Colors.white),
        //   Icon(Icons.groups_outlined, size: 30, color: Colors.white),
        // ],
        // color: FrontEndConfig.kButtonColor,
        // buttonBackgroundColor: FrontEndConfig.kButtonColor,
        backgroundColor: Colors.white,
        onButtonPressed: (index){
          bottomNavigationProvider.setIndex(index);
        },

        barItems: [
        BarItem(
          icon: Icons.groups_outlined,
          title: 'Category',
        ),
        BarItem(
          icon: Icons.add,
          title: 'Add Notes',
        ),
        BarItem(
          icon: Icons.person,
          title: 'Profile',
        ),
        /// Add more BarItem if you want
      ], activeColor: FrontEndConfig.kButtonColor,
        selectedIndex: bottomNavigationProvider.getIndex,
      ),
      body: _pager[bottomNavigationProvider.getIndex],
    );
  }
}
