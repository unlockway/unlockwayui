import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    super.key,
    required this.title,
    required this.placeholder,
    required this.width,
  });

  final String title;
  final String placeholder;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(darkBgdark)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(primarydark)),
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: placeholder,
        label: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
          ),
        ),
        hintStyle: const TextStyle(color: Color(0xFF616B7C)),
        filled: true,
        fillColor: Color(darkBglight),
        focusColor: Color(darkBglight),
      ),
      style: const TextStyle(fontFamily: "Inter", color: Colors.white),
    );
  }
}
