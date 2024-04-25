import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/vendor_repository.dart';
import '../cubit/vendors_cubit.dart';
import '../widgets/vendors_loaded.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VendorCubit(
        vendorRepository: locator<VendorRepository>(),
      ),
      child: const VendorsViewNew(),
    );
  }
}

class VendorsViewNew extends StatefulWidget {
  const VendorsViewNew({super.key});

  @override
  State<VendorsViewNew> createState() => _VendorsViewNewState();
}

class _VendorsViewNewState extends State<VendorsViewNew> {
  @override
  void initState() {
    super.initState();
    context.read<VendorCubit>().fetchVendorsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Vendors'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<VendorCubit, VendorState>(
            builder: (context, state) {
              if (state.status == VendorStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == VendorStatus.failure) {
                return Center(
                  child: Text('${state.errorMessage}'),
                );
              }
              return VendorsLoaded(
                vendors: state.vendors.reversed.toList(),
                // constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
