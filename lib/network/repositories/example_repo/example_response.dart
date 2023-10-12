import 'package:behomie/features/Home/model/example_user_list.dart';
import 'package:behomie/constants/constants.dart' as constants;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExampleRepository {
  final _dio = Dio();

  final String _examplePath = "${constants.apiBaseUrl}+example";
  //up to your ip

  Future<ExampleListUser> requestExample() async {
    try {
      var response = await _dio.get(
        _examplePath,
      );

      return ExampleListUser.fromJson(response.data ?? []);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return ExampleListUser.fromJson({"error": e});
    }
  }
}
