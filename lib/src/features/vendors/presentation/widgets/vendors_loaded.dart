import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

import '../../../../core/dummy/pages/school_detail_page.dart';
import '../../domain/entities/vendor.dart';
import '../cubit/vendors_cubit.dart';
import '../pages/add_vendor_page.dart';
import '../pages/vendor_details_page.dart';

class VendorsLoaded extends StatefulWidget {
  const VendorsLoaded({
    super.key,
    required this.vendors,
  });

  final List<Vendor> vendors;

  @override
  State<VendorsLoaded> createState() => _VendorsLoadedState();
}

class _VendorsLoadedState extends State<VendorsLoaded> {
  Future<void> _refresh() async {
    context.read<VendorCubit>().fetchVendorsList();
    Future.delayed(
      const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 200),
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: widget.vendors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VendorDetailsPage(
                            vendorId: widget.vendors[index].id ?? ''),
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
                          Container(
                            height: 120,
                            width: 170,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.vendors[index].image ??
                                          'https://e7.pngegg.com/pngimages/759/202/png-clipart-education-vendor-logo-learning-teaching-angle-class.png',
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.vendors[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.vendors[index].location),
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
        Positioned(
          bottom: 0,
          child: Container(
            height: 100,
            color: Colors.white,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: BlueButton(
              text: 'Add a vendor',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddVendorPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
