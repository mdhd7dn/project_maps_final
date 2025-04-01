import 'package:my_case/featuers/consultationes/data/datasources/consultation_datasource.dart';
import 'package:my_case/featuers/consultationes/domain/entities/consulation.dart';
import 'package:my_case/featuers/consultationes/data/models/consultation_model.dart';
import 'package:my_case/featuers/consultationes/domain/repositories/consultation_repositories.dart';

class ConsultationRepositoryImpl extends ConsultationRepository {
  final ConsultationRemoteDataSource remoteDataSource;

  ConsultationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Consultation>> getConsultations() async {
    return await remoteDataSource.getConsultations();
  }

  @override
  Future<Consultation> getConsultationById(int id) async {
    return await remoteDataSource.getConsultationById(id);
  }

  @override
  Future<Consultation> addConsultation(Consultation consultation) async {
    return await remoteDataSource
        .addConsultation(consultation as ConsultationModel);
  }

  @override
  Future<Consultation> updateConsultation(Consultation consultation) async {
    return await remoteDataSource
        .updateConsultation(consultation as ConsultationModel);
  }

  @override
  Future<void> deleteConsultation(int id) async {
    await remoteDataSource.deleteConsultation(id);
  }
}
