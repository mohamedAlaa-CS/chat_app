import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/screens/sign_up/sign_up.dart';

import '../../shared/components/component.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuriy = MediaQuery.of(context).size;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Center(
              child: Container(
                width: mediaQuriy.width / 2.7,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: mediaQuriy.width / 3,
                    height: mediaQuriy.height / 6,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Scholar Chat",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(fontSize: 32, color: Colors.white),
            ),
            const Spacer(),
            const SizedBox(height: 20),
            Text(
              "Sigin In",
              style: GoogleFonts.aBeeZee(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(height: 20),
            defaultTextField(hitText: 'Email', controller: emailController),
            const SizedBox(height: 15),
            defaultTextField(
                hitText: 'Password', controller: passwordController),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    print('Done ya man');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'No user found for that email.',
                          ),
                        ),
                      );
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Wrong password provided for that user.',
                          ),
                        ),
                      );
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "dont't have n account ",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                customTextBottom(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    title: 'Register'),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
