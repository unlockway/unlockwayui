// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:http/http.dart' as http;

Future<void> registerAPI(
  BuildContext context,
  String firstname,
  String lastname,
  String email,
  String password,
  double height,
  double weight,
  String goals,
  String biotype,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/auth/register'; // Substitua pelo seu endpoint da API

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "height": height.toString(), // Converter para String
        "weight": weight.toString(), // Converter para String
        "goals": goals,
        "biotype": biotype,
      },
    );

    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Usuário criado com sucesso",
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
