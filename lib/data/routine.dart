import 'package:unlockway/constants.dart';
import 'package:unlockway/models/routine.dart';

List<RoutineModel> routine = userRoutines.map((entry) {
  return RoutineModel(
    entry['id'],
    entry['name'],
    entry['meals'],
    entry['inUsage'],
    entry['weekRepetitions'],
    entry['totalCaloriesInTheDay'],
    entry['createdAt'],
    entry['updatedAt'],
  );
}).toList();
