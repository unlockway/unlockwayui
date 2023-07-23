import 'package:flutter/material.dart';

class Meals {
  const Meals(this.title, this.ingredients, this.description, this.img);

  final String title;
  final String description;
  final List<String> ingredients;
  final Image img;
}
