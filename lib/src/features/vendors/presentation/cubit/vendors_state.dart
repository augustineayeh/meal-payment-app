// ignore_for_file: public_member_api_docs, sort_constructors_first



part of 'vendors_cubit.dart';

enum VendorStatus { initial, loading, success, failure }

class VendorState extends Equatable {
  const VendorState({
    this.name = const Field.pure(),
    this.location = const Field.pure(),
    this.phoneNumber = const Field.pure(),
    this.status = VendorStatus.initial,
    this.school = const Field.pure(),
    this.vendor = Vendor.empty,
    this.vendors = const <Vendor>[],
    this.errorMessage,
  });
  final Field name;
  final Field location;
  final Field phoneNumber;

  final VendorStatus status;
  final Field school;
  final Vendor vendor;

  final List<Vendor> vendors;
  final String? errorMessage;

 

  VendorState copyWith({
    Field? name,
    Field? location,
    Field? phoneNumber,
    VendorStatus? status,
    Field? school,
    Vendor? vendor,
    List<Vendor>? vendors,
    String? errorMessage,
  }) {
    return VendorState(
      name: name ?? this.name,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      school: school ?? this.school,
      vendor: vendor ?? this.vendor,
      vendors: vendors ?? this.vendors,
      errorMessage: errorMessage ?? this.errorMessage,
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
      vendors,
      errorMessage,
    ];
  }
}
