import 'package:json_annotation/json_annotation.dart';

part 'example_user.g.dart';

@JsonSerializable()
class ExampleUser {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'id')
  int? id;

  ExampleUser({
    this.id,
    this.name,
    this.description,
  });

  factory ExampleUser.fromJson(Map<String, dynamic> json) =>
      _$ExampleUserFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleUserToJson(this);
}
