
import 'package:unlockway/models/goals.dart';

class UserModel {
  UserModel({
    this.id,
    this.photo,
    this.firstName,
    this.lastName,
    this.token,
    this.email,
    this.height,
    this.weight,
    this.goals,
    this.biotype,
    this.createdAt,
    this.updatedAt,
    this.imc,
    this.sex,
    required this.nutritionist,
  });

  String? id;
  Object? photo;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  double? height;
  double? weight;
  double? imc;
  Goals? goals;
  String? biotype;
  String? sex;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool nutritionist;

  List<String> getGoalsAsText(Goals? goals) {
    List<String> goalsText = [];
    if (goals != null) {
      if (goals.gainMuscularMass) goalsText.add("Ganhar massa muscular");
      if (goals.loseWeight) goalsText.add("Perder peso");
      if (goals.maintainHealth) goalsText.add("Manter Saúde");
    }
    return goalsText;
  }

  String getBiotypeAsText(String? biotype) {
    switch (biotype) {
      case "ENDOMORPH":
        return "Endomorfo";
      case "ECTOMORPH":
        return "Ectomorfo";
      case "MESOMORPH":
        return "Mesomorfo";
      default:
        return "Biotipo desconhecido";
    }
  }

  factory UserModel.fromMap(Map<Object?, Object?> map) {
    var goals = map["goals"] as Map<Object?, Object?>;

    return UserModel(
      id: map['id'] as String?,
      firstName: map['firstname'] as String?,
      lastName: map['lastname'] as String?,
      photo: map["photo"],
      email: map["email"] as String?,
      token: map["token"] as String?,
      height: map["height"] as double?,
      weight: map["weight"] as double?,
      imc: map["imc"] as double?,
      sex: map["sex"] as String?,
      goals: Goals(
        gainMuscularMass: goals["gainMuscularMass"] as bool? ?? false,
        maintainHealth: goals["maintainHealth"] as bool? ?? false,
        loseWeight: goals["loseWeight"] as bool? ?? false,
      ),
      biotype: map["biotype"] as String?,
      nutritionist: map["nutritionist"] as bool? ??
          false, // Verifica se o valor é nulo e define um padrão
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}
