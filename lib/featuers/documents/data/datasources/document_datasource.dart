import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/document_model.dart';

abstract class DocumentRemoteDataSource {
  Future<DocumentModel> addDocument(DocumentModel document);
  Future<List<DocumentModel>> getDocuments();
  Future<DocumentModel> getDocumentById(int id);
  Future<void> deleteDocument(int id);
  Future<DocumentModel> updateDocument(DocumentModel document);
}

class DocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  final String baseUrl =
      "http://samerabosamra-001-site1.mtempurl.com/api/documents";

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
      throw Exception("المستند غير موجود");
    } else {
      throw Exception(
          "فشل في جلب بيانات المستند. رمز الخطأ: ${response.statusCode}");
    }
  }

  @override
  Future<DocumentModel> addDocument(DocumentModel document) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(document.toJson()),
    );

    if (response.statusCode == 201) {
      return DocumentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add document");
    }
  }

  @override
  Future<List<DocumentModel>> getDocuments() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => DocumentModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch documents");
    }
  }

  @override
  Future<void> deleteDocument(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete document");
    }
  }

  @override
  Future<DocumentModel> updateDocument(DocumentModel document) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${document.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(document.toJson()),
    );

    if (response.statusCode == 200) {
      return DocumentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update document");
    }
  }
}
