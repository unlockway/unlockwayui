import 'package:unlockway/models/goals.dart';
import 'package:unlockway/models/user.dart';

class PatientUserModel extends UserModel {
  PatientUserModel({
    super.id,
    super.photo,
    super.firstName,
    super.lastName,
    super.email,
    super.token,
    super.height,
    super.weight,
    super.imc,
    super.goals,
    super.biotype,
    super.sex,
    super.createdAt,
    super.updatedAt,
    super.cfnToken,
    this.relationId,
  });

  String? relationId;

  // Você pode adicionar métodos ou funcionalidades específicas para PatientUserModel aqui, se necessário.

  factory PatientUserModel.fromMap(Map<Object?, Object?> map) {
    return PatientUserModel(
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
        gainMuscularMass: (map['goals']
                as Map<Object?, Object?>?)?['gainMuscularMass'] as bool? ??
            false,
        maintainHealth: (map['goals']
                as Map<Object?, Object?>?)?['maintainHealth'] as bool? ??
            false,
        loseWeight:
            (map['goals'] as Map<Object?, Object?>?)?['loseWeight'] as bool? ??
                false,
      ),
      biotype: map["biotype"] as String?,
      cfnToken: map["cfn"] as String?,
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ??
          DateTime.now(),
      relationId: map['idRelation'] as String?,
    );
  }
}
