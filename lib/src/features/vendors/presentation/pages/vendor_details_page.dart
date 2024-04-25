// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/core/service_locator/service_locator.dart';
import 'package:meal_payment_app/src/features/vendors/domain/repositories/vendor_repository.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/cubit/vendors_cubit.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/widgets/vendor_details_loaded.dart';

class VendorDetailsPage extends StatelessWidget {
  const VendorDetailsPage({
    super.key,
    required this.vendorId,
  });

  final String vendorId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VendorCubit(
        vendorRepository: locator<VendorRepository>(),
      ),
      child: VendorDetailsView(
        vendorId: vendorId,
      ),
    );
  }
}

class VendorDetailsView extends StatefulWidget {
  const VendorDetailsView({
    super.key,
    required this.vendorId,
  });

  final String vendorId;

  @override
  State<VendorDetailsView> createState() => _VendorDetailsViewState();
}

class _VendorDetailsViewState extends State<VendorDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<VendorCubit>().fetchSingleVendor(widget.vendorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<VendorCubit, VendorState>(
            builder: (context, state) {
              if (state.status == VendorStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == VendorStatus.failure) {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
              return VendorDetailsLoaded(
                vendor: state.vendor,
                constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
