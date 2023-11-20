class IngredientModel {
  const IngredientModel({
    required this.id,
    required this.photo,
    required this.name,
    required this.measure,
    required this.description,
    required this.calories,
    required this.proteins,
    required this.water,
    required this.minerals,
    required this.vitamins,
    required this.fats,
  });

  final String id;
  final String photo;
  final String name;
  final String measure;
  final String description;
  final double calories;
  final double proteins;
  final double water;
  final String minerals;
  final String vitamins;
  final double fats;

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      id: map['id'],
      name: map["name"],
      description: map["description"],
      photo: map["photo"],
      calories: double.parse(map["calories"]),
      proteins: double.parse(map["proteins"]),
      water: double.parse(map["water"]),
      minerals: map["minerals"],
      vitamins: map["vitamins"],
      measure: map['measure'],
      fats: double.parse(map["fats"]),
    );
  }
}

class SelectedFood {
  SelectedFood(
    this.id,
    this.amount,
  );

  String id;
  double amount;

  // Convert the object to a map
  Map<String, dynamic> toJson() => {'id': id, 'amount': amount};
}
