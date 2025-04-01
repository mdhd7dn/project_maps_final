import '../../domain/entities/document.dart';

class DocumentModel extends Document {
  DocumentModel({
    required int id,
    required String nationalId,
    required String nationalIDCard,
    required String userId,
    required int caseId,
  }) : super(
          id: id,
          nationalId: nationalId,
          nationalIDCard: nationalIDCard,
          userId: userId,
          caseId: caseId,
        );
  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] ?? 0,
      nationalId: json['nationalId'] ?? 'غير متوفر',
      nationalIDCard: json['nationalIDCard'] ?? 'غير متوفر',
      userId: json['userId'] ?? 'غير معروف',
      caseId: json['caseId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nationalId": nationalId,
      "nationalIDCard": nationalIDCard,
      "userId": userId,
      "caseId": caseId,
    };
  }
}
