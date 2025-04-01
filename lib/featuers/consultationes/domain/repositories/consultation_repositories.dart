import 'package:my_case/featuers/consultationes/domain/entities/consulation.dart';

abstract class ConsultationRepository {
  Future<Consultation> addConsultation(Consultation consultation);
  Future<List<Consultation>> getConsultations();
  Future<Consultation> getConsultationById(int id);
  Future<void> deleteConsultation(int id);
  Future<Consultation> updateConsultation(Consultation consultation);
}
