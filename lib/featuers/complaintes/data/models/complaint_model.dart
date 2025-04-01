import '../../domain/entities/complaint.dart';

class ComplaintModel extends Complaint {
  ComplaintModel({
    String? description,
    required DateTime date,
    String? lawyerId,
    String? userId,
  }) : super(
          description: description,
          date: date,
          lawyerId: lawyerId,
          userId: userId,
        );

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      description: json['description'],
      date: DateTime.parse(json['date']),
      lawyerId: json['lawyerId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "date": date.toIso8601String(),
      "lawyerId": lawyerId,
      "userId": userId,
    };
  }
}
