import 'package:get/get.dart';
import 'package:my_case/featuers/documents/data/models/document_model.dart';
import 'package:my_case/featuers/documents/domain/repositories/document_repositories.dart';
import '../../domain/entities/document.dart';

class DocumentController extends GetxController {
  final DocumentRepository repository;

  DocumentController(this.repository);

  RxList<Document> documents = <Document>[].obs;
  Rx<Document?> currentDocument = Rx<Document?>(null);
  RxBool loading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getDocumentById(int id) async {
    try {
      print("🔍 جلب الوثيقة بالرقم: $id");
      loading.value = true;
      error.value = '';

      var document = await repository.getDocumentById(id);
      print("✅ الوثيقة تم جلبها: ${document.nationalId}");

      currentDocument.value = document;
    } catch (e) {
      error.value = e.toString();
      print("❌ خطأ في جلب الوثيقة: $e");
    } finally {
      loading.value = false;
    }
  }

  Future<void> fetchDocuments() async {
    loading.value = true;
    try {
      // documents.value = await repository.getDocuments();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> addDocument(Document document) async {
    loading.value = true;
    try {
      final newDocument = await repository.addDocument(document);
      // documents.add(newDocument);
      Get.snackbar("Success", "Document added successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }

  // Future<void> updateDocument(Document document) async {
  //   loading.value = true;
  //   // try {
  //     // final updatedDocument = await repository.updateDocument(document);
  //     documents[documents.indexWhere((d) => d.id == document.id)] =
  //         // updatedDocument;
  //     // Get.snackbar("Success", "Document updated successfully");
  //   // } catch (e) {
  //     // Get.snackbar("Error", e.toString());
  //   // } finally {
  //     // isLoading.value = false;
  //   // }
  // }

  Future<void> deleteDocument(int id) async {
    loading.value = true;
    try {
      await repository.deleteDocument(id);
      documents.removeWhere((document) => document.id == id);
      Get.snackbar("Success", "Document deleted successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }
}
