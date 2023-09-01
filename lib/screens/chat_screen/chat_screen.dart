import 'package:flutter/material.dart';
import 'package:social_app/shared/constants/constants.dart';

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
          SizedBox(width: 6,),
          Text('Chat')
        ],),
      ),
    );
    
  }
}