// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'order_cubit.dart';

enum OrderStatus { initial, loading, success, failure }

class OrderState extends Equatable {
  const OrderState({
    this.itemOrdered = const Field.pure(),
    this.dateOrdered = const Field.pure(),
    this.orderedBy = const Field.pure(),
    this.status = OrderStatus.initial,
    this.order = OrderEntity.empty,
    this.orders = const <OrderEntity>[],
    this.formStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });
  final Field itemOrdered;
  final Field dateOrdered;
  final Field orderedBy;

  final OrderStatus status;
  final OrderEntity order;
  final List<OrderEntity> orders;
  final String? errorMessage;
  final FormzSubmissionStatus formStatus;
  final bool isValid;

  OrderState copyWith({
    Field? itemOrdered,
    Field? dateOrdered,
    Field? orderedBy,
    OrderStatus? status,
    OrderEntity? order,
    List<OrderEntity>? orders,
    String? errorMessage,
    bool? isValid,
    FormzSubmissionStatus? formStatus,
  }) {
    return OrderState(
      itemOrdered: itemOrdered ?? this.itemOrdered,
      dateOrdered: dateOrdered ?? this.dateOrdered,
      orderedBy: orderedBy ?? this.orderedBy,
      status: status ?? this.status,
      order: order ?? this.order,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? errorMessage,
      isValid: isValid ?? this.isValid,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props {
    return [
      itemOrdered,
      dateOrdered,
      orderedBy,
      status,
      order,
      orders,
      errorMessage,
      isValid,
      formStatus,
    ];
  }
}
