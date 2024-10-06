import 'package:unlockway/models/user.dart';

class HomeDataModel {
  const HomeDataModel({
    required this.meals,
    required this.routines,
    required this.notifications,
    required this.weekCalories,
  });

  final int meals;
  final int routines;
  final int notifications;
  final List<double?> weekCalories;

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    // Converting the dynamic list to List<double?>
    List<dynamic> weekCaloriesDynamic = map['weekCalories'];
    List<double?> weekCaloriesList = weekCaloriesDynamic.map((calorie) {
      if (calorie == null) {
        return null;
      } else {
        return (calorie as num).toDouble();
      }
    }).toList();

    return HomeDataModel(
      meals: map['meals'],
      routines: map['routines'],
      notifications: map['notifications'],
      weekCalories: weekCaloriesList,
    );
  }
}

class NutriHomeDataModel {
  const NutriHomeDataModel({
    required this.notifications,
    required this.clients,
  });

  final int notifications;
  final List<UserModel?> clients;

  factory NutriHomeDataModel.fromMap(Map<String, dynamic> map) {
    List<dynamic> userListDynamic = map['userList'];
    List<UserModel?> userList = userListDynamic.map((user) {
      if (user == null) {
        return null;
      } else {
        return UserModel.fromMap(user as Map<String, dynamic>);
      }
    }).toList();

    return NutriHomeDataModel(
      notifications: map['notifications'],
      clients: userList,
    );
  }
}
