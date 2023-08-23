import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase_provider/presentation/view/home/home_view.dart';
import 'package:notesapp_firebase_provider/presentation/view/onboarding/onboarding_view.dart';
import 'package:notesapp_firebase_provider/provider/add_notes_provider.dart';
import 'package:notesapp_firebase_provider/provider/auth/login_provider.dart';
import 'package:notesapp_firebase_provider/provider/auth/registration_provider.dart';
import 'package:notesapp_firebase_provider/provider/auth/signout_provider.dart';
import 'package:notesapp_firebase_provider/provider/bottom_nav_provider.dart';
import 'package:notesapp_firebase_provider/provider/dropdown_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>  const MyApp(),)
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider(),),
        ChangeNotifierProvider(create: (context) => SignOutProvider(),),
        ChangeNotifierProvider(create: (context) => DropDownProvider(),),
        ChangeNotifierProvider(create: (context) => AddNotesProvider(),)
      ],
      child: MaterialApp(home: FirebaseAuth.instance.currentUser != null? const HomeView() : const OnboardingView()),
    );
  }
}
