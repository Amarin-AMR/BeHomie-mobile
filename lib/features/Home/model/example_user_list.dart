import 'package:behomie/features/Home/model/example_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_user_list.g.dart';

@JsonSerializable()
class ExampleListUser {
  @JsonKey(name: 'msg', defaultValue: [])
  List<ExampleUser>? listUser;

  ExampleListUser({
    this.listUser,
  });

  factory ExampleListUser.fromJson(Map<String, dynamic> json) =>
      _$ExampleListUserFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleListUserToJson(this);
}
