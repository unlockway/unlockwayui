import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/routine_suggestion.dart';

class RecommendationModel {
  const RecommendationModel({
    required this.id,
    required this.idNutritionist,
    this.nutritionistPhoto,
    required this.idPatient,
    this.patientComment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.mealSuggestions,
    required this.routineSuggestions,
    required this.description,
  });

  final String id;
  final String idNutritionist;
  final String? nutritionistPhoto;
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
      id: map['id'] ?? '', // Valor padrão vazio para campos obrigatórios
      idNutritionist: map['idNutritionist'] ?? '',
      nutritionistPhoto: map['nutritionistPhoto'], // Permitir nulo
      idPatient: map['idPatient'] ?? '',
      description:
          map['description'] ?? 'Sem descrição', // Valor padrão para texto
      patientComment: map['patientComment'], // Permitir nulo
      status:
          map['status'] ?? 'UNKNOWN', // Valor padrão para status desconhecido
      mealSuggestions: map['mealsSuggetions'] != null
          ? List<MealSuggestion>.from(
              map['mealsSuggetions'].map(
                (mealSuggestion) => MealSuggestion.fromMap(mealSuggestion),
              ),
            )
          : [], // Lista vazia como fallback
      routineSuggestions: map['routineSuggetions'] != null
          ? List<RoutineSuggestion>.from(
              map['routineSuggetions'].map(
                (routineSuggestion) =>
                    RoutineSuggestion.fromMap(routineSuggestion),
              ),
            )
          : [], // Lista vazia como fallback
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'].toString())
          : DateTime.now(), // Data atual como fallback
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'].toString())
          : DateTime.now(), // Data atual como fallback
    );
  }
}
