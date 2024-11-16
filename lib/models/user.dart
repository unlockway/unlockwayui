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
    this.cfnToken,
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
  String? cfnToken;

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
      cfnToken: map["cfn"] != null
          ? map["cfn"] as String?
          : null, // Adiciona a verificação para cfn
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  factory UserModel.fromMapSimple(Map<Object?, Object?> map) {
    return UserModel(
      id: map['id'] as String?,
      firstName: map['firstname'] as String?,
      lastName: map['lastname'] as String?,
      photo: map["photo"],
      email: map["email"] as String?,
      cfnToken: map["cfn"] as String?, // Apenas o cfn é lido
      token: map["token"] as String?,
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ??
          DateTime.now(),
      // Todos os outros campos ficam como nulos
      height: null,
      weight: null,
      imc: null,
      goals: null,
      biotype: null,
      sex: null,
    );
  }
}
