// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  const Menu({
   required this.id,
    required this.name,
    required this.details,
    this.image,
    this.dateCreated,
    required this.price,
    required this.vendorId,
    required this.days,
  });
  final String id;
  final String name;
  final List<dynamic> details;
  final String? image;
  final String? dateCreated;
  final double price;
  final String vendorId;
  final String days;

  static const empty = Menu(
    name: '',
    price: 0,
    vendorId: '',
    days: '',
    dateCreated: '',
    details: [],
    id: '',
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
