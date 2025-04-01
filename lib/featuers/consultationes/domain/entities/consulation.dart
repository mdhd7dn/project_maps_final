class Consultation {
  final String question;
  final DateTime date;
  final String? lawyerId;
  final String? userId;

  Consultation({
    required this.question,
    required this.date,
    this.lawyerId,
    this.userId,
  });
}
