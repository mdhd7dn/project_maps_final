import 'package:get/get.dart';
import 'package:my_case/featuers/cases/presenrtaion/bindings/casebinding.dart';
import 'package:my_case/featuers/complaintes/presenrtaion/bindings/complaint_binding.dart';
import 'package:my_case/featuers/consultationes/presenrtaion/bindings/consultation_binding.dart';
import 'package:my_case/featuers/courts/presenrtaion/bindings/court_binding.dart';
import 'package:my_case/featuers/documents/presenrtaion/bindings/document_binding.dart';
import 'package:my_case/featuers/hearings/presenrtaion/bindings/hearing_binding.dart';
import 'package:my_case/featuers/users/presenrtaion/bindings/user_binding.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    UserBinding().dependencies();
    CaseBinding().dependencies();
    ComplaintBinding().dependencies();
    ConsultationBinding().dependencies();
    CourtBinding().dependencies();
    DocumentBinding().dependencies();
    HearingBinding().dependencies();
  }
}
