import 'package:flutter/material.dart';

Widget defaultTextField(
    {required String hitText, TextEditingController? controller}) {
  return TextFormField(
    validator: (data) {
      if (data!.isEmpty) {
        return 'field is required';
      }
    },
    //keyboardType: TextInputType.text,
    controller: controller,
    style: const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
      errorStyle: const TextStyle(
          fontSize: 20, color: Colors.deepOrange, fontWeight: FontWeight.bold),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.yellowAccent),
      ),
    ),
  );
}

Widget customTextBottom(
    {required String title, required VoidCallback onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    ),
  );
}

Widget customBottom({required String title, required VoidCallback onPressed}) {
  return SizedBox(
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
