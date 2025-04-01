class Complaint {
  final String? description;
  final DateTime date;
  final String? lawyerId;
  final String? userId;

  Complaint({
    this.description,
    required this.date,
    this.lawyerId,
    this.userId,
  });
}
