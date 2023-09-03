import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/screens/chat_screen/chat_screen.dart';
import 'package:social_app/screens/sign_up/sign_up.dart';
import 'firebase_options.dart';
import 'screens/login_screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
    void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('------------------User is currently signed out!');
    } else {
      print('------------------User is signed in!');
      print(user);
    }
  });

    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   
   initialRoute:FirebaseAuth.instance.currentUser == null? LoginScreen.routeName : ChatScreeen.routeName,      
    routes: {
      LoginScreen.routeName :(context) => const LoginScreen(),
      SignUp.routeName:(context) => SignUp(),
      ChatScreeen.routeName:(context) => ChatScreeen()
    },
    );
  }
}
