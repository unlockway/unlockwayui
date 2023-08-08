import 'package:flutter/material.dart';
import 'package:unlockway/screens/cellphone/pages/login.dart';

class PhoneScaffold extends StatefulWidget {
  const PhoneScaffold({super.key});

  @override
  State<PhoneScaffold> createState() => _PhoneScaffoldState();
}

class _PhoneScaffoldState extends State<PhoneScaffold> {
  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}
