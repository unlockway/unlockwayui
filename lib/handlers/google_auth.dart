// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/home/home.dart';
import 'package:unlockway/screens/register/register.dart';

Future<void> loginGoogleAPI(
  BuildContext context, {
  required String? email,
  required String? name,
  required String? password,
}) async {
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

    Map<Object?, Object?> user = json.decode(response.body);

    userData = UserModel.fromMap(user);

    navigatePage(
      context,
      const Home(),
    );
  } catch (e) {
    Navigator.push(
      context,
      navigationPageRightAnimation(
        RegisterScreen(
          googleId: password,
          googleEmail: email,
        ),
      ),
    );
  }
}
