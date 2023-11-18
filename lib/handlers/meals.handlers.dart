// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/ingredients.dart';

Future<void> getMealsAPI(
  BuildContext context,
  String userID,
  String sessionToken,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/meals/findByUserId'; // Substitua pelo seu endpoint da API

  try {
    var bodyApi = json.encode(userID);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $sessionToken',
        "Content-type": "application/json"
      },
      body: bodyApi,
    );

    userMeals = json.decode(response.body);
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
}

Future<void> createMealsAPI(
  BuildContext context,
  String sessionToken,
  String userID,
  String name,
  String category,
  String description,
  String preparationMethod,
  List<SelectedFood> ingredients,
  File? imageFile,
) async {
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/meals';

  var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
    ..headers['Authorization'] = 'Bearer $sessionToken';

  var payload = {
    "userId": userID,
    "name": name,
    "category": category,
    "description": description,
    "preparationMethod": preparationMethod,
    "ingredients": ingredients.map((e) => e.toJson()).toList()
  };

  String payloadEncoded = json.encode(payload);

  request.fields["payload"] = payloadEncoded;

  // Add image file
  if (imageFile != null) {
    var imageStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile('photo', imageStream, length,
        filename: imageFile.path.split('/').last,
        contentType: MediaType(
          "image",
          imageFile.path.split(".").last,
        ));

    request.files.add(multipartFile);
  }

  await request.send().then((response) {
    if (response.statusCode == 201) {
      modalBuilderBottomAnimation(
        context,
        const SimplePopup(
          message: "Refeição criada com sucesso",
        ),
      );
    }

    if (response.statusCode == 400) {
      modalBuilderBottomAnimation(
        context,
        const SimplePopup(
          message: "Erro ao criar refeição",
        ),
      );
    }
  });
}

Future<void> deleteMealAPI(
    BuildContext context, String sessionToken, String mealID) async {
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/meals/';

  try {
    final response = await http.delete(
      Uri.parse(apiUrl).replace(queryParameters: {
        'id': mealID,
      }),
      headers: {
        'Authorization': 'Bearer $sessionToken',
        "Content-type": "application/json"
      },
    );

    userMeals = json.decode(response.body);
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
}
