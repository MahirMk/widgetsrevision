import 'package:json_annotation/json_annotation.dart';

part 'PeopleModel.g.dart';

@JsonSerializable()
class People {
  People({this.name, this.id});
  int? id;
  String? name;

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}