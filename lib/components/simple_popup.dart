import 'package:flutter/material.dart';

class SimplePopup extends StatelessWidget {
  const SimplePopup({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          message,
          style: TextStyle(
            fontFamily: "Inter",
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
