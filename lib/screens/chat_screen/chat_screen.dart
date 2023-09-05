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
 var email =FirebaseAuth.instance.currentUser?.email ?? ModalRoute.of(context)!.settings.arguments  as String ;
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
              body: Container(
                decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/background.png'),fit:BoxFit.fill )
              ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 0),
                        reverse: true,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          return messageList[index].email == email? ChatBuble(messageModel:messageList[index] ) :ChatBubleForFrind(messageModel: messageList[index]) ;
                        },
                        itemCount: messageList.length,
                      ),
                    ),
                    TextFieldInChat(
                        controller: controller,
                        onSubmitted: (data) {
                          MessageModel messageModel = MessageModel(message: data, email: email );
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
              ),
            );
          } else {
            return Scaffold(
              body: Container(
                 decoration:const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/background.png'),fit:BoxFit.fill )
                ),
                child:  Center(child: CircularProgressIndicator())),
            );
          }
        });
  }
}
