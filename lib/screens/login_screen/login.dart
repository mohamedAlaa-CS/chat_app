import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_app/screens/chat_screen/chat_screen.dart';
import 'package:social_app/screens/sign_up/sign_up.dart';
import 'package:social_app/shared/constants/constants.dart';

import '../../shared/components/component.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuriy = MediaQuery.of(context).size;


    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        backgroundColor: kPrimaryColor,
        body: Padding(
          padding:   EdgeInsets.only(top: mediaQuriy.height/16,left: 10,right: 10,bottom: 10),
          child: Form(
            key: formKey,
            child: ListView(
              
              children: [
             
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
               const  SizedBox(height: 10),
                Text(
                  "Scholar Chat",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(fontSize: 32, color: Colors.white),
                ),
               
                 SizedBox(height: mediaQuriy.height/10),
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
                customBottom(
                    title: 'Login',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser(emailController, passwordController);
            
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, ChatScreeen.routeName, arguments:emailController.text );
                          print('Done ya man');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,
                                title: 'No user found for that email.');
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                title:
                                    'Wrong password provided for that user.');
                            print('Wrong password provided for that user.');
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don  't have n account ",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    customTextBottom(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUp.routeName);
                        },
                        title: 'Register'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, {required String title}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
        ),
      ),
    );
  }

  Future<void> loginUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    print('Done ya man');
  }
}
