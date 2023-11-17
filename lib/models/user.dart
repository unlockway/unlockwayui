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
  });

  String? id;
  Object? photo;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  double? height;
  double? weight;
  Goals? goals;
  String? biotype;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserModel.fromMap(Map<Object?, Object?> map) {
    var goals = map["goals"] as Map<Object?, Object?>;

    return UserModel(
      id: map['id'] as String,
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
      photo: map["photo"],
      email: map["email"] as String,
      token: map["token"] as String,
      height: map["height"] as double,
      weight: map["weight"] as double,
      goals: Goals(
        gainMuscularMass: goals["gainMuscularMass"] as bool,
        maintainHealth: goals["maintainHealth"] as bool,
        loseWeight: goals["loseWeight"] as bool,
      ),
      biotype: map["biotype"] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
    );
  }
}
