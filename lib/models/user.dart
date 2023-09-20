class UserModel {
  const UserModel(
    this.idUser,
    this.profileImage,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.height,
    this.weight,
    this.goals,
    this.biotype,
    this.createdAt,
    this.updatedAt,
    this.isEnable,
    this.availableAICredits,
  );

  final String idUser;
  final String profileImage;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final double height;
  final double weight;
  final Enum goals;
  final Enum biotype;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEnable;
  final int availableAICredits;
}
