import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}
