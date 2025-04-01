import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:my_case/featuers/hearings/data/models/hearing_model.dart';
import 'package:my_case/featuers/hearings/domain/entities/hearing.dart';
import 'package:my_case/featuers/hearings/domain/repositories/hearing_repositories.dart';

class HearingController extends GetxController {
  final HearingRepository repository;
  final RxList<Hearing> hearings = <Hearing>[].obs;
  final RxBool isLoading = true.obs;
  final RxString error = RxString('');

  HearingController(this.repository);
  Future<void> fetchHearings() async {
    try {
      isLoading.value = true;
      error.value = '';

      final response = await http.get(Uri.parse(
          'http://samerabosamra-001-site1.mtempurl.com/api/hearings'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        hearings.value =
            data.map((json) => HearingModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (e) {
      error.value = 'حدث خطأ: ${e.toString()}';
      Get.snackbar(
        'خطأ',
        'فشل في تحميل الجلسات',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool get hasError => error.value.isNotEmpty;

  bool get hearingsEmpty => hearings.isEmpty;

  Future<void> addHearing(Hearing newHearing) async {
    try {
      var addedHearing = await repository.addHearing(newHearing);
      hearings.add(addedHearing);
    } catch (e) {
      print("Error adding hearing: $e");
    }
  }
}

  // Future<void> updateHearing(Hearing updatedHearing) async {
  //   try {
  //     var updated = await repository.updateHearing(updatedHearing);
  //     var index = hearings.indexWhere((h) => h.id == updated.id);
  //     if (index != -1) {
  //       hearings[index] = updated;
  //     }
  //   } catch (e) {
  //     print("Error updating hearing: $e");
  //   }
  // }

//   Future<void> deleteHearing(int id) async {
//     try {
//       await repository.deleteHearing(id);
//       hearings.removeWhere((h) => h.id == id);
//     } catch (e) {
//       print("Error deleting hearing: $e");
//     }
//   }
// }
