import 'package:my_case/featuers/consultationes/domain/entities/consulation.dart';

class ConsultationModel extends Consultation {
  ConsultationModel({
    required String question,
    required DateTime date,
    String? lawyerId,
    String? userId,
  }) : super(
          question: question,
          date: date,
          lawyerId: lawyerId,
          userId: userId,
        );

  factory ConsultationModel.fromJson(Map<String, dynamic> json) {
    return ConsultationModel(
      question: json['question'],
      date: DateTime.parse(json['date']),
      lawyerId: json['lawyerId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "question": question,
      "date": date.toIso8601String(),
      "lawyerId": lawyerId,
      "userId": userId,
    };
  }
}
