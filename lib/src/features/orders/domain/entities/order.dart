import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? id;
  final String itemOrdered;
  final String dateOrdered;
  final String orderedBy;

  const Order({
    this.id,
    required this.itemOrdered,
    required this.dateOrdered,
    required this.orderedBy,
  });

  static const empty = Order(
    itemOrdered: '',
    dateOrdered: '',
    orderedBy: '',
    id: '',
  );
  @override
  List<Object?> get props => [
        id,
        itemOrdered,
        dateOrdered,
        orderedBy,
      ];
}
