import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/screens/login_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../shared/components/component.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'register';
  SignUp({super.key});

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
              "Register",
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
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'The password provided is too weak.',
                      ),),);
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'The account already exists for that email.',
                      ),
                      ),
                      );
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Register',
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
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    title: 'Login')
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
