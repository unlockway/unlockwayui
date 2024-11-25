import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/routine_suggestion.dart';

class RecommendationModel {
  const RecommendationModel({
    required this.id,
    required this.idNutritionist,
    required this.idPatient,
    required this.patientComment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.mealSuggestions,
    required this.routineSuggestions,
    required this.description,
  });

  final String id;
  final String idNutritionist;
  final String idPatient;
  final String description;
  final String? patientComment;
  final String status;
  final List<MealSuggestion> mealSuggestions;
  final List<RoutineSuggestion> routineSuggestions;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get formattedStatus {
    switch (status) {
      case "SENT":
        return "ENVIADA";
      case "DENIED":
        return "NEGADA";
      case "APPROVED":
        return "ACEITA";
      default:
        return "DESCONHECIDO"; // Para valores inesperados
    }
  }

  factory RecommendationModel.fromMap(Map<String, dynamic> map) {
    return RecommendationModel(
      id: map['id'],
      idNutritionist: map['idNutritionist'],
      idPatient: map['idPatient'],
      description: map['description'],
      patientComment: map['patientComment'],
      status: map['status'],
      mealSuggestions: List<MealSuggestion>.from(
        map['mealsSuggetions'].map(
          (mealSuggestion) => MealSuggestion.fromMap(mealSuggestion),
        ),
      ),
      routineSuggestions: List<RoutineSuggestion>.from(
        map['routineSuggetions'].map(
          (routineSuggestion) => RoutineSuggestion.fromMap(routineSuggestion),
        ),
      ),
      createdAt: DateTime.parse(map['createdAt'].toString()),
      updatedAt: DateTime.parse(map['updatedAt'].toString()),
    );
  }
}
