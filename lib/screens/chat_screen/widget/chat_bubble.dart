import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

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
                topRight: Radius.circular(32))),
        child: const Text(
          'i am a new user',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
