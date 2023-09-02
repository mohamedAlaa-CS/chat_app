import 'package:flutter/material.dart';
import 'package:social_app/shared/constants/constants.dart';

import 'widget/chat_bubble.dart';

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
          Image.asset(kLogo,height: 35,),
         const  SizedBox(width: 6,),
          const Text('Chat')
        ],),
      ),
      body: ListView.builder(itemBuilder: (context, index)=>ChatBuble()),
    );
    
  }
}
