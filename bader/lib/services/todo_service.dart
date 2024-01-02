import 'package:bader/services/client.dart';
import 'package:dio/dio.dart';

class MedService {
  Future<List<Med>> getMedsListApi() async {
    try {
      final responseValue = await ApiClient.get("/meditations");
      if (responseValue.statusCode == 200) {
        final MedModel medModel = MedModel.fromJson(responseValue.data);
        return medModel.data ?? [];
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createMedApi(String medName, bool? isComplete) async {
    try {
      final Response response = await ApiClient.post(
        "/meditations",
        data: {
          "medName": medName,
          "isComplete": isComplete,
        },
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateMedApi(String id, bool? isComplete) async {
    try {
      final response = await ApiClient.put(
        "meditations/$id",
        data: {
          "isComplete": isComplete,
        },
      );

      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}

class MedModel {
  final List<Med>? data;

  MedModel({this.data});

  factory MedModel.fromJson(Map<String, dynamic> json) {
    return MedModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Med.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Med {
  final String id;
  final String medName;
  final bool isComplete;

  Med({
    required this.id,
    required this.medName,
    required this.isComplete,
  });

  factory Med.fromJson(Map<String, dynamic> json) {
    return Med(
      id: json['id'] as String,
      medName: json['medName'] as String,
      isComplete: json['isComplete'] as bool,
    );
  }
}
