import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_case/featuers/payments/data/models/fineorapyment_model.dart';

abstract class FineOrPaymentRemoteDataSource {
  Future<List<FineOrPaymentModel>> getFinesOrPayments();
  Future<FineOrPaymentModel> getFineOrPaymentById(int id);
  Future<FineOrPaymentModel> addFineOrPayment(FineOrPaymentModel fine);
  Future<FineOrPaymentModel> updateFineOrPayment(FineOrPaymentModel fine);
  Future<void> deleteFineOrPayment(int id);
}

class FineOrPaymentRemoteDataSourceImpl
    implements FineOrPaymentRemoteDataSource {
  final String baseUrl = "https://yourapi.com/api/payments";

  @override
  Future<List<FineOrPaymentModel>> getFinesOrPayments() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => FineOrPaymentModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch payments");
    }
  }

  @override
  Future<FineOrPaymentModel> getFineOrPaymentById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return FineOrPaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch payment");
    }
  }

  @override
  Future<FineOrPaymentModel> addFineOrPayment(FineOrPaymentModel fine) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(fine.toJson()),
    );

    if (response.statusCode == 201) {
      return FineOrPaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add payment");
    }
  }

  @override
  Future<FineOrPaymentModel> updateFineOrPayment(
      FineOrPaymentModel fine) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${fine.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(fine.toJson()),
    );

    if (response.statusCode == 200) {
      return FineOrPaymentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update payment");
    }
  }

  @override
  Future<void> deleteFineOrPayment(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete payment");
    }
  }
}
