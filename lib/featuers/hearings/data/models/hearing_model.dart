import 'package:my_case/featuers/hearings/domain/entities/hearing.dart';

class HearingModel extends Hearing {
  HearingModel({
    required DateTime date,
    required String sessionLocation,
    required String notes,
    required String userId,
    required int caseId,
    required int courtsId,
    String? lawyerId,
  }) : super(
          date: date,
          sessionLocation: sessionLocation,
          notes: notes,
          userId: userId,
          caseId: caseId,
          courtsId: courtsId,
          lawyerId: lawyerId,
        );

  factory HearingModel.fromJson(Map<String, dynamic> json) {
    return HearingModel(
      date: DateTime.parse(json['date']),
      sessionLocation: json['sessionLocation'],
      notes: json['notes'],
      userId: json['userId'],
      caseId: json['caseId'],
      courtsId: json['courtsId'],
      lawyerId: json['lawyerId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'sessionLocation': sessionLocation,
        'notes': notes,
        'userId': userId,
        'caseId': caseId,
        'courtsId': courtsId,
        'lawyerId': lawyerId,
      };
}
