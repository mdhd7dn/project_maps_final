import 'package:my_case/featuers/payments/data/datasources/fineorpayment_datasource.dart';
import 'package:my_case/featuers/payments/domain/entities/payment.dart';
import 'package:my_case/featuers/payments/data/models/fineorapyment_model.dart';
import 'package:my_case/featuers/payments/domain/repositories/fineorpayment_repositories.dart';

class FineOrPaymentRepositoryImpl extends FineOrPaymentRepository {
  final FineOrPaymentRemoteDataSource remoteDataSource;

  FineOrPaymentRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FineOrPayment>> getFinesOrPayments() async {
    return await remoteDataSource.getFinesOrPayments();
  }

  @override
  Future<FineOrPayment> getFineOrPaymentById(int id) async {
    return await remoteDataSource.getFineOrPaymentById(id);
  }

  @override
  Future<FineOrPayment> addFineOrPayment(FineOrPayment fine) async {
    return await remoteDataSource.addFineOrPayment(fine as FineOrPaymentModel);
  }

  @override
  Future<FineOrPayment> updateFineOrPayment(FineOrPayment fine) async {
    return await remoteDataSource
        .updateFineOrPayment(fine as FineOrPaymentModel);
  }

  @override
  Future<void> deleteFineOrPayment(int id) async {
    await remoteDataSource.deleteFineOrPayment(id);
  }
}
