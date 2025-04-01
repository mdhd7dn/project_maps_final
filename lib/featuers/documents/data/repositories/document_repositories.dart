import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_case/featuers/documents/data/datasources/document_datasource.dart';
import 'package:my_case/featuers/documents/domain/entities/document.dart';
import 'package:my_case/featuers/documents/data/models/document_model.dart';
import 'package:my_case/featuers/documents/domain/repositories/document_repositories.dart';

class DocumentRepositoryImpl extends DocumentRepository {
  final DocumentRemoteDataSource remoteDataSource;

  DocumentRepositoryImpl(this.remoteDataSource);

  final String baseUrl =
      "http://samerabosamra-001-site1.mtempurl.com/api/Documents";

  @override
  Future<DocumentModel> getDocumentById(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/GetById?id=$id"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return DocumentModel.fromJson(responseData);
    } else if (response.statusCode == 404) {
      throw Exception("الوثيقة غير موجودة");
    } else {
      throw Exception(
          "فشل في جلب بيانات الوثيقة. رمز الخطأ: ${response.statusCode}");
    }
  }

  @override
  Future<Document> addDocument(Document document) async {
    return await remoteDataSource.addDocument(document as DocumentModel);
  }

  @override
  Future<List<Document>> getDocuments() async {
    return await remoteDataSource.getDocuments();
  }

  @override
  Future<void> deleteDocument(int id) async {
    await remoteDataSource.deleteDocument(id);
  }

  @override
  Future<Document> updateDocument(Document document) async {
    return await remoteDataSource.updateDocument(document as DocumentModel);
  }
}
