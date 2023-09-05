import 'package:flutter/material.dart';
import 'package:social_app/models/message_model.dart';

import '../../../shared/constants/constants.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
//var time = TimeOfDay.fromDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32)),),
        child: Column(
          children: [
            Text(
              messageModel.message!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          //    Text(
          // //  ' ${DateFormat.jm().format(messageModel.createdAt!)}',
          //  // '${messageModel.createdAt.hour.toString()}:${messageModel.createdAt.minute.toString()}:${messageModel.createdAt.second}',
          //    messageModel.createdAt.toString(),
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 16,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          ],
        ),
        
      ),
    );
  }
}

class ChatBubleForFrind extends StatelessWidget {
  const ChatBubleForFrind({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)
                ),
                
                ),
        child: Column(
          children: [
            Text(
              messageModel.message!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(
            //   messageModel.createdAt as String,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontSize: 16,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}