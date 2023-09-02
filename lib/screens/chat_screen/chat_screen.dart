import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/screens/login_screen/login.dart';
import 'package:social_app/shared/constants/constants.dart';

import 'widget/chat_bubble.dart';
import 'widget/text_field.dart';

class ChatScreeen extends StatelessWidget {
  static const String routeName = 'chat_screen';
  const ChatScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 35,
            ),
            const SizedBox(
              width: 6,
            ),
            const Text('Chat')
          ],
        ),
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, LoginScreen.routeName);
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                ListView.builder(itemBuilder: (context, index) => ChatBuble()),
          ),
         const  TextFieldInChat(),
        ],
      ),
    );
  }
}
