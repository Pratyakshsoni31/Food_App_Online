import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/onboarding_page.dart';
import 'Pages/home_page.dart';
import 'Pages/signin_page.dart';
import 'Pages/signup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser!=null? "/home" : "/",
      routes: {
        "/": (context) => const Onboarding(),
        "/signin":(context) => const Signin(),
        "/signup":(context) => const Signup(),
        "/home":(context) => const Home(),
      }
    );
  }
}
