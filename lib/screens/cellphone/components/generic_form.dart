import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class GenericForm extends StatelessWidget {
  const GenericForm(
      {super.key,
      required this.title,
      required this.placeholder,
      required this.width});

  final String title;
  final String placeholder;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: placeholder,
            hintStyle: const TextStyle(color: Color(0xFF616B7C)),
            filled: true,
            fillColor: Color(darkBglight),
            focusColor: Color(darkBglight),
          ),
        )
      ],
    );
  }
}
