import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/models/message_model.dart';
import 'package:social_app/screens/login_screen/login.dart';
import 'package:social_app/shared/constants/constants.dart';
import 'package:social_app/shared/firebase/firebase_function.dart';
import 'widget/chat_bubble.dart';
import 'widget/text_field.dart';

class ChatScreeen extends StatelessWidget {
  static const String routeName = 'chat_screen';
  final ScrollController _controller = ScrollController();

  ChatScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();

    return StreamBuilder(
        stream: FirebaseFunction.getCollection()
            .orderBy(MessageModel.createAt, descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var messageList =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
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
                  IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 0),
                      reverse: true,
                      controller: _controller,
                      itemBuilder: (context, index) => ChatBuble(
                        messageModel: messageList[index],
                      ),
                      itemCount: messageList.length,
                    ),
                  ),
                  TextFieldInChat(
                      controller: controller,
                      onSubmitted: (data) {
                        MessageModel messageModel = MessageModel(message: data);
                        FirebaseFunction.addmessage(messageModel);
                        controller.clear();
                        _controller.animateTo(
                          0,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 500),
                        );
                      }),
                ],
              ),
            );
          } else {
            return Text('worng');
          }
        });
  }
}
