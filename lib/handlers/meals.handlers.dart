// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/meals.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meals.dart';

Future<void> getMealsAPI(
  BuildContext context,
  String userID,
  String sessionToken,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/meals/findByUserId';

  final response = await http.get(
    Uri.parse(apiUrl).replace(queryParameters: {
      'id': userID,
    }),
    headers: {
      'Authorization': 'Bearer $sessionToken',
    },
  );

  userMeals = json.decode(response.body);

  meals = userMeals.map((entry) {
    return MealsModel(
      entry['id'],
      entry['name'],
      entry['photo'],
      entry['description'],
      entry['category'],
      entry['preparationMethod'],
      entry["ingredients"],
      entry['totalCalories'],
      entry['createdAt'],
      entry['updatedAt'],
    );
  }).toList();

  print(response.statusCode);
  print(userMeals);
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

  await request.send().then(
    (response) {
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
    },
  );
}

Future<void> editMealsAPI(
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

  var request = http.MultipartRequest('PUT', Uri.parse(apiUrl))
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

  await request.send().then(
    (response) {
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
    },
  );
}

Future<void> deleteMealAPI(
  BuildContext context,
  String sessionToken,
  String mealID,
) async {
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/meals/';

  final response = await http.delete(
    Uri.parse(apiUrl).replace(queryParameters: {
      'id': mealID,
    }),
    headers: {
      'Authorization': 'Bearer $sessionToken',
    },
  );
  print(response.statusCode);
}
