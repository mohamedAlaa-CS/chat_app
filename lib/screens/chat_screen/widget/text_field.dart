import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

class TextFieldInChat extends StatelessWidget {
   TextFieldInChat({super.key, required this.onSubmitted, required this.controller});
 final Function(String) onSubmitted;
  TextEditingController  controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    )),
              ),
            ),
          );
  }
}