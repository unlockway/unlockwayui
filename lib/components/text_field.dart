import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unlockway/constants.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    super.key,
    required this.title,
    required this.placeholder,
    required this.width,
    required this.controller,
    required this.number,
    required this.value,
  });

  final String title;
  final String placeholder;
  final double width;
  final TextEditingController controller;
  final bool number;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value == "" ? "" : value,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          number ? RegExp(r'^\d+\.?\d{0,2}') : RegExp(r'[^a-zA-Z0-9]'),
        ),
      ],
      controller: controller,
      cursorColor: Theme.of(context).colorScheme.outline,
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
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontFamily: "Inter",
          ),
        ),
        hintStyle: const TextStyle(color: Color(0xFF616B7C)),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onBackground,
        focusColor: Theme.of(context).colorScheme.onBackground,
      ),
      style: TextStyle(
        fontFamily: "Inter",
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class TextFieldMultline extends StatelessWidget {
  const TextFieldMultline({
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
      minLines: 3,
      maxLines: 10,
      cursorColor: Theme.of(context).colorScheme.outline,
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
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontFamily: "Inter",
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xFF616B7C),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onBackground,
        focusColor: Theme.of(context).colorScheme.onBackground,
      ),
      style: TextStyle(
        fontFamily: "Inter",
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}
