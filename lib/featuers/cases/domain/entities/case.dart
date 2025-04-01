import 'package:my_case/featuers/documents/domain/entities/document.dart';
import 'package:my_case/featuers/hearings/domain/entities/hearing.dart';
import 'package:my_case/featuers/payments/domain/entities/payment.dart';

class Case {
  final int? id;
  final int caseNumber;
  final String caseType;
  final String? title;
  final String? description;
  final String status;
  final String date;
  final String userId;
  final String? lawyerId;
  final int courtId;

  // العلاقات
  final List<Document> documents;
  final List<Hearing> hearings;
  final List<FineOrPayment> payments;

  Case({
    this.id,
    required this.caseNumber,
    required this.caseType,
    this.title,
    this.description,
    required this.status,
    required this.date,
    required this.userId,
    this.lawyerId,
    required this.courtId,
    this.documents = const [],
    this.hearings = const [],
    this.payments = const [],
  });
}
