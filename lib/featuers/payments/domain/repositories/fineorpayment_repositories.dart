import 'package:my_case/featuers/payments/domain/entities/payment.dart';

abstract class FineOrPaymentRepository {
  Future<FineOrPayment> addFineOrPayment(FineOrPayment fine);
  Future<List<FineOrPayment>> getFinesOrPayments();
  Future<FineOrPayment> getFineOrPaymentById(int id);
  Future<void> deleteFineOrPayment(int id);
  Future<FineOrPayment> updateFineOrPayment(FineOrPayment fine);
}
