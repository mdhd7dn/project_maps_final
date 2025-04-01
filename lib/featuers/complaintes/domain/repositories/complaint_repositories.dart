import '../entities/complaint.dart';

abstract class ComplaintRepository {
  Future<Complaint> addComplaint(Complaint complaint);
  Future<List<Complaint>> getComplaints();
  Future<Complaint> getComplaintById(int id);
  Future<void> deleteComplaint(int id);
  Future<Complaint> updateComplaint(Complaint complaint);
}
