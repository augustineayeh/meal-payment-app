
import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Login {
  const LoginModel({
    required super.email,
    required super.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
