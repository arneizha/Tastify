import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/boarding_page.dart';
import 'package:flutter_application/firebase_options.dart';
import 'package:flutter_application/loading_screen.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/profil_page.dart';
import 'package:flutter_application/review_cafe.dart';

FirebaseApp? app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Data loaded!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            return BoardingPage();
          }
        },
      ),
    );
  }
}
