import 'package:my_case/featuers/payments/domain/entities/payment.dart';

class FineOrPaymentModel extends FineOrPayment {
  FineOrPaymentModel({
    required int id,
    required DateTime date,
    required PaymentMethod paymentMethod,
    required PaymentState paymentState,
    required int caseId,
    required String userId,
  }) : super(
          id: id,
          date: date,
          paymentMethod: paymentMethod,
          paymentState: paymentState,
          caseId: caseId,
          userId: userId,
        );

  factory FineOrPaymentModel.fromJson(Map<String, dynamic> json) {
    return FineOrPaymentModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      paymentMethod: PaymentMethod.values[json['paymentMethod']],
      paymentState: PaymentState.values[json['paymentState']],
      caseId: json['caseId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date.toIso8601String(),
      "paymentMethod": paymentMethod.index,
      "paymentState": paymentState.index,
      "caseId": caseId,
      "userId": userId,
    };
  }
}
