// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/core/service_locator/service_locator.dart';
import 'package:meal_payment_app/src/features/orders/domain/repositories/order_repository.dart';
import 'package:meal_payment_app/src/features/orders/presentation/cubit/order_cubit.dart';
import 'package:meal_payment_app/src/features/orders/presentation/widgets/order_loaded.dart';


class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    super.key,
    required this.orderId,
  });

  final String orderId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        orderRepository: locator<OrderRepository>(),
      ),
      child: OrderDetailsView(
        orderId: orderId,
      ),
    );
  }
}

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().fetchSingleOrder(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state.status == OrderStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == OrderStatus.failure) {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
              return OrderDetailsLoaded(
                order: state.order,
                constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
