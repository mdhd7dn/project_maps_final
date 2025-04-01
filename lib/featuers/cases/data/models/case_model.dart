import '../../domain/entities/case.dart';

class CaseModel extends Case {
  CaseModel({
    super.id,
    required super.caseNumber,
    required super.caseType,
    super.title,
    super.description,
    required super.status,
    required super.date,
    required super.userId,
    super.lawyerId,
    required super.courtId,
    super.documents = const [],
    super.hearings = const [],
    super.payments = const [],
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      caseNumber: json['caseNumber'],
      caseType: json['caseTybe'],
      title: json['titel'],
      description: json['description'],
      status: json['status'],
      date: json['date'],
      userId: json['userId'],
      lawyerId: json['lawyerId'],
      courtId: json['courtsId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caseNumber': caseNumber,
      'caseTybe': caseType,
      'titel': title,
      'description': description,
      'status': status,
      'date': date,
      'userId': userId,
      'lawyerId': lawyerId,
      'courtsId': courtId,
    };
  }
}
