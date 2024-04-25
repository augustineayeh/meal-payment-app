// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'vendors_cubit.dart';

enum VendorStatus { initial, loading, success, failure }

class VendorState extends Equatable {
  const VendorState({
    this.name = const Field.pure(),
    this.image = const Field.pure(),
    this.location = const Field.pure(),
    this.phoneNumber = const Field.pure(),
    this.status = VendorStatus.initial,
    this.school = School.empty,
    this.vendor = Vendor.empty,
    this.vendors = const <Vendor>[],
    this.formStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });
  final Field name;
  final Field location;
  final Field image;
  final Field phoneNumber;
  final VendorStatus status;
  final School school;
  final Vendor vendor;
  final FormzSubmissionStatus formStatus;
  final bool isValid;
  final List<Vendor> vendors;
  final String? errorMessage;

  VendorState copyWith({
    Field? name,
    Field? location,
    Field? phoneNumber,
    Field? image,
    VendorStatus? status,
    School? school,
    Vendor? vendor,
    List<Vendor>? vendors,
    String? errorMessage,
    bool? isValid,
    FormzSubmissionStatus? formStatus,
  }) {
    return VendorState(
      name: name ?? this.name,
      image: image ?? this.image,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      school: school ?? this.school,
      vendor: vendor ?? this.vendor,
      vendors: vendors ?? this.vendors,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      location,
      phoneNumber,
      status,
      school,
      vendor,
      image,
      vendors,
      errorMessage,
      isValid,
      formStatus,
    ];
  }
}
