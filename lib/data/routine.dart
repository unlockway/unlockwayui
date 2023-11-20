import 'package:unlockway/constants.dart';
import 'package:unlockway/models/routine.dart';

List<RoutineModel> routine = userRoutines.map((entry) {
  Map<String, bool> weekRepetition =
      Map<String, bool>.from(entry['weekRepetitions']);
  List<bool> weekRepetitionsList = weekRepetition.values.toList();

  return RoutineModel(
    entry['id'],
    entry['name'],
    entry['meals'],
    entry['inUsage'],
    weekRepetitionsList,
    entry['totalCaloriesInTheDay'],
    entry['createdAt'],
    entry['updatedAt'],
  );
}).toList();
