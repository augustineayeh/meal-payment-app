// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/pages/vendor_details_page.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/pages/vendors_page.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../domain/entities/vendor.dart';
import '../../domain/repositories/vendor_repository.dart';
import '../cubit/vendors_cubit.dart';

class HorizontalVendorsList extends StatelessWidget {
  const HorizontalVendorsList({
    super.key,
  
  });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VendorCubit(vendorRepository: locator<VendorRepository>()),
      child: HorizontalVendorsListView(
        
      ),
    );
  }
}

class HorizontalVendorsListView extends StatefulWidget {
  const HorizontalVendorsListView({
    super.key,
 
  });
 

  @override
  State<HorizontalVendorsListView> createState() =>
      _HorizontalVendorsListViewState();
}

class _HorizontalVendorsListViewState extends State<HorizontalVendorsListView> {
  @override
  void initState() {
    super.initState();
    context.read<VendorCubit>().fetchVendorsList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<VendorCubit, VendorState>(
          builder: (context, state) {
            if (state.status == VendorStatus.success) {
              if (state.vendors.isEmpty) {
                return const Center(
                  child: Text('No vendors have been registered yet'),
                );
              }
              return _HorizontalVendorsListViewLoaded(
            
                vendors: state.vendors.reversed.toList(),
                constraints: constraints,
              );
            } else if (state.status == VendorStatus.loading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return Center(
              child: Text('Sorry. An error occurred: ${state.errorMessage}'),
            );
          },
        );
      },
    );
  }
}

class _HorizontalVendorsListViewLoaded extends StatelessWidget {
  const _HorizontalVendorsListViewLoaded({
    super.key,
    required this.vendors,
    required this.constraints,

  });

  final List<Vendor> vendors;
  final BoxConstraints constraints;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 160,
                width: 146 * 3,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 16,
                  ),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VendorDetailsPage(
                                vendorId: vendors[index].id!,
                              ),
                            ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          vendors[index].image != null
                              ? Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        vendors[index].image!,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                )
                              : Image.asset(
                                  'assets/user-chef.png',
                                  height: 80,
                                ),
                          const Gap(8),
                          Text(vendors[index].name),
                        ],
                      ),
                    );
                  },
                ),
              ),
              if (vendors.length > 3)
                Opacity(
                  opacity: 0.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VendorsPage(),
                          ));
                    },
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(vendors[3].image!),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'View all',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
