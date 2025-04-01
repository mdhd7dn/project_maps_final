import 'package:my_case/featuers/complaintes/data/datasources/complaint_datasource.dart';
import 'package:my_case/featuers/complaintes/data/models/complaint_model.dart';
import 'package:my_case/featuers/complaintes/domain/entities/complaint.dart';
import 'package:my_case/featuers/complaintes/domain/repositories/complaint_repositories.dart';

class ComplaintRepositoryImpl extends ComplaintRepository {
  final ComplaintDatasource datasource;

  ComplaintRepositoryImpl(this.datasource);

  @override
  Future<List<Complaint>> getComplaints() async {
    return await datasource.getAllComplaints();
  }

  @override
  Future<Complaint> getComplaintById(int id) async {
    return await datasource.getComplaintById(id);
  }

  @override
  Future<Complaint> addComplaint(Complaint complaint) async {
    ComplaintModel complaintModel = ComplaintModel(
      description: complaint.description,
      date: complaint.date,
      lawyerId: complaint.lawyerId,
      userId: complaint.userId,
    );
    return await datasource.addComplaint(complaintModel);
  }

  @override
  Future<void> deleteComplaint(int id) async {
    await datasource.deleteComplaint(id);
  }

  @override
  Future<Complaint> updateComplaint(Complaint complaint) {
    // TODO: implement updateComplaint
    throw UnimplementedError();
  }

  // @override
  // Future<Complaint> updateComplaint(Complaint complaint) async {
  //   ComplaintModel complaintModel = ComplaintModel(
  //     description: complaint.description,
  //     date: complaint.date,
  //     lawyerId: complaint.lawyerId,
  //     userId: complaint.userId,
  //   );
  //   return await datasource.updateComplaint(complaintModel);
  // }
}
