// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:http/http.dart' as http;

Future<void> loginAPI(
  BuildContext context,
  String email,
  String password,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/auth/authenticate'; // Substitua pelo seu endpoint da API

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        "email": email,
        "password": password,
      },
    );

    final responseData = json.decode(response.body);
    final String teste = "Logou na conta ${responseData['firstname']}";

    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: teste,
      ),
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
