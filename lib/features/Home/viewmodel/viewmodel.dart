import 'package:behomie/features/Home/model/example_user_list.dart';

import 'package:behomie/network/repositories/example_repo/example_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  final ExampleRepository _exampleRepository = ExampleRepository();

  Future<ExampleListUser> _fetchUser() async {
    state = const AsyncValue.loading();

    var response = await _exampleRepository.requestExample();

    return response;
  }

  @override
  Future<ExampleListUser> build() async {
    return _fetchUser();
  }
}
