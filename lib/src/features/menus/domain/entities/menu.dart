// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final String? id;
  final String name;
  final String details;
  final String? image;
  final String dateCreated;
  final int price;
  final String vendorId;
  final String days;
  const Menu({
    this.id,
    required this.name,
    required this.details,
    this.image,
    required this.dateCreated,
    required this.price,
    required this.vendorId,
    required this.days,
  });

  static const empty = Menu(
    name: '',
    price: 0,
    vendorId: '',
    days: '',
    dateCreated: '',
    details: '',
  );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      details,
      image,
      dateCreated,
      price,
      vendorId,
      days,
    ];
  }
}
