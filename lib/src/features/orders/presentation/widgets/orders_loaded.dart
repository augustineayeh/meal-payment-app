import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import '../../domain/entities/order.dart';
import '../cubit/order_cubit.dart';
import '../pages/order_details_page.dart';

class OrdersLoaded extends StatefulWidget {
  const OrdersLoaded({
    super.key,
    required this.orders,
  });

  final List<OrderEntity> orders;

  @override
  State<OrdersLoaded> createState() => _OrdersLoadedState();
}

class _OrdersLoadedState extends State<OrdersLoaded> {
  Future<void> _refresh() async {
    context.read<OrderCubit>().fetchOrders();
    Future.delayed(
      const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: widget.orders.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsPage(
                          orderId: widget.orders[index].id ?? ''),
                    ));
              },
              child: Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: const [
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: null,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      icon: Icons.info,
                      label: 'Suspend',
                    ),
                  ],
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   height: 120,
                        //   width: 170,
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: NetworkImage(
                        //             widget.orders[index]. ??
                        //                 'https://e7.pngegg.com/pngimages/759/202/png-clipart-education-order-logo-learning-teaching-angle-class.png',
                        //           ),
                        //           fit: BoxFit.cover),
                        //       borderRadius: BorderRadius.circular(20)),
                        // ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.orders[index].dateOrdered,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              // Text(widget.orders[index].),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Positioned(
      //   bottom: 0,
      //   child: Container(
      //     height: 100,
      //     color: Colors.white,
      //     width: MediaQuery.sizeOf(context).width,
      //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      //     child: BlueButton(
      //       text: 'Add a order',
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const AddOrderPage(),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    ]);
  }
}
