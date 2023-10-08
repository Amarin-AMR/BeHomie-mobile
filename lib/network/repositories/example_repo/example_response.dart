import 'package:behomie/features/Home/model/example_list.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExampleRepository {
  final _dio = Dio();

  final String _examplePath = "http://192.168.1.9:4001/example";
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
