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
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
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
              customBottom(
                  title: 'Register',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await registerUser(emailController, passwordController);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context,
                              text: 'The password provided is too weak.');
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              text:
                                  'The account already exists for that email.');
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      showSnackBar(context, text: 'success');
                    }
                  }),
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
      ),
    );
  }

  void showSnackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
        ),
      ),
    );
  }

  Future<void> registerUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
