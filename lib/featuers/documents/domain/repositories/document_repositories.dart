import '../entities/document.dart';

abstract class DocumentRepository {
  Future<Document> addDocument(Document document);
  Future<List<Document>> getDocuments();
  Future<Document> getDocumentById(int id);
  Future<void> deleteDocument(int id);
  Future<Document> updateDocument(Document document);
}
