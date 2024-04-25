import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import '../../../menus/domain/entities/menu.dart';
import '../../data/models/order_model.dart';
import '../../domain/repositories/order_repository.dart';

import '../../domain/entities/order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({
    required OrderRepository orderRepository,
  })  : _orderRepository = orderRepository,
        super(
          const OrderState(),
        );

  final OrderRepository _orderRepository;

  void createOrder(
    Menu menu,
  ) async {
    final order = OrderModel(
      itemOrdered: menu.id!,
      dateOrdered: DateTime.now().toString(),
      orderedBy: state.orderedBy.value,
    );

    final failureOrSuccess = await _orderRepository.createOrder(order: order);
    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            formStatus: FormzSubmissionStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (success) => emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
        ),
      ),
    );
  }

  void fetchOrders() async {
    emit(
      state.copyWith(
        status: OrderStatus.loading,
      ),
    );

    final failureOrOrdersList = await _orderRepository.fetchOrders();

    failureOrOrdersList.fold(
      (failure) {
        emit(
          state.copyWith(
            status: OrderStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (ordersList) {
        emit(
          state.copyWith(
            status: OrderStatus.success,
            orders: ordersList,
          ),
        );
      },
    );
  }

  void fetchSingleOrder(String orderId) async {
    emit(
      state.copyWith(
        status: OrderStatus.loading,
      ),
    );

    final failureOrOrder = await _orderRepository.fetchSingleOrder(orderId);

    failureOrOrder.fold(
      (failure) {
        emit(
          state.copyWith(
            status: OrderStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (order) {
        emit(
          state.copyWith(
            status: OrderStatus.success,
            order: order,
          ),
        );
      },
    );
  }
}
