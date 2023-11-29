// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';
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

    Map<Object?, Object?> user = json.decode(response.body);

    userData = UserModel.fromMap(user);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Email', userData.email!);
    await prefs.setString('Password', password);

    navigatePage(
      context,
      const Home(),
    );
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: e.toString(),
      ),
    );
  }
}
