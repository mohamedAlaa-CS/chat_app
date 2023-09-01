import 'package:flutter/material.dart';

Widget defaultTextField({
  required String hitText,
  TextEditingController? controller
}) {
  return TextField(
    
    controller: controller,
    style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
    decoration: InputDecoration(
   focusColor: Colors.white,
      hintText: hitText,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
}

Widget customTextBottom({
  required String title,
  required VoidCallback onPressed
}) {
  return TextButton(
    onPressed: onPressed,
    child:  Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    ),
  );
}