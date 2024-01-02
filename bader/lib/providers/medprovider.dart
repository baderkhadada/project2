// import 'package:bader/services/todo_service.dart';
// import 'package:flutter/material.dart';

// class MedProvider extends ChangeNotifier {
//   List<Med> medsList = [];

//   final MedService _medService = MedService();

//   Future<void> medList() async {
//     medsList = (await _medService.getMedsListApi()).cast<Med>();
//     notifyListeners();
//   }

//   Future<void> createNewMed(String medName, bool? isComplete) async {
//     await _medService.createMedApi(medName, isComplete);
//     await medList();
//   }

//   Future<void> updateMed(String id, bool? isComplete) async {
//     await _medService.updateMedApi(id, isComplete);
//     await medList();
//   }

//   void updateNote(String id, bool? checkBoxValue) {}
// }

// class Med {
//   late String medName;
//   late bool? isComplete;
//   late String id;

//   Med({required this.medName, required this.isComplete, required this.id});

//   factory Med.fromJson(Map<String, dynamic> json) {
//     return Med(
//       medName: json['medName'] as String,
//       isComplete: json['isComplete'] as bool?,
//       id: json['id'] as String,
//     );
//   }
// }
