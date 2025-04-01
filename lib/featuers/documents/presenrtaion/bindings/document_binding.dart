import 'package:get/get.dart';
import 'package:my_case/featuers/documents/data/datasources/document_datasource.dart';
import 'package:my_case/featuers/documents/data/repositories/document_repositories.dart';
import 'package:my_case/featuers/documents/domain/repositories/document_repositories.dart';
import '../controllers/document_controller.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentRemoteDataSource>(() => DocumentRemoteDataSourceImpl());
    Get.lazyPut<DocumentRepository>(() => DocumentRepositoryImpl(Get.find()));
    Get.lazyPut<DocumentController>(() => DocumentController(Get.find()));
  }
}
