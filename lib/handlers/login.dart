// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/home.dart';

Future<void> loginAPI(
  BuildContext context,
  String email,
  String password,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/auth/authenticate';

  Map payload = {
    "email": email,
    "password": password,
  };

  // Encoding Map to JSON
  var body = json.encode(payload);

  try {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-type": "application/json"}, body: body);

    userData = json.decode(response.body);

    navigatePage(
      context,
      const Home(),
    );
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
}
