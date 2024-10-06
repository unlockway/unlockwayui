import 'package:unlockway/models/goals.dart';
import 'package:unlockway/models/user.dart';

List<UserModel> dummyUsers = [
  UserModel(
    id: "user_1",
    firstName: "John",
    lastName: "Doe",
    email: "johndoe@example.com",
    photo: "path/to/profile_pic.jpg", // Replace with your photo path
    // ... other user data (height, weight, etc.)
    goals: const Goals(
      gainMuscularMass: true, // Adjust goals as needed
      maintainHealth: false,
      loseWeight: false,
    ),
    biotype: "Ectomorph", // Replace with user's biotype
    sex: "Male", // Replace with user's sex
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    nutritionist: false,
  ),
];
