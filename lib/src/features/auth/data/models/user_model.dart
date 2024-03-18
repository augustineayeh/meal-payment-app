
import 'package:json_annotation/json_annotation.dart';
import 'package:meal_payment_app/src/features/auth/domain/domain.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends User {
  const UserModel({
    required super.id,
    required this.firstName,
    required this.lastName,
    required super.email,
    required super.bio,
    required super.avatar,
    required super.phone,
    super.birthday,
    required super.city,
    required super.country,
    super.interests,
    super.languages,
    this.created,
    this.updated,
    //   required super.gender,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          created: created,
          updated: updated,
        );

  @override
  @JsonKey(name: 'first_name')
  final String firstName;

  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  @override
  @JsonKey(name: 'created_at')
  final DateTime? created;

  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updated;

  static const empty = User.empty;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
