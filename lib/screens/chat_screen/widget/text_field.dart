import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';

// ignore: must_be_immutable
class TextFieldInChat extends StatelessWidget {
   TextFieldInChat({super.key, required this.onSubmitted, required this.controller});
 final Function(String) onSubmitted;
  TextEditingController  controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 6),
            child: TextField(
              style:const TextStyle(color:Colors.white),
              controller: controller,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
              
                hintText: 'Send Message',
                hintStyle:const  TextStyle(color: Colors.white),
                suffixIcon:  Icon(
                  Icons.send,
                  color: Colors.red.shade500,
                  
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:  BorderSide(
                      color: Colors.yellow.shade100,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:  BorderSide(
                      color: Colors.yellow.shade100,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:  BorderSide(
                      color: Colors.yellow.shade100,
                    )),
              ),
            ),
          );
  }
}