
import 'package:json_annotation/json_annotation.dart';
import '../../domain/domain.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignupModel extends Signup {
  const SignupModel({
    required super.firstName,
    super.lastName,
    required super.email,
    required super.password,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupModelToJson(this);
}
