enum PaymentMethod {
  bankTransfer, // تحويل بنكي
  card, // بطاقة
  cash, // نقدي
}

enum PaymentState {
  paid,
  late,
}

class FineOrPayment {
  final int id;
  final DateTime date;
  final PaymentMethod paymentMethod;
  final PaymentState paymentState;
  final int caseId;
  final String userId;

  FineOrPayment({
    required this.id,
    required this.date,
    required this.paymentMethod,
    required this.paymentState,
    required this.caseId,
    required this.userId,
  });
}
