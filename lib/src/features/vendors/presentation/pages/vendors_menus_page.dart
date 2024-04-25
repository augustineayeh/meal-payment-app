// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/features/menus/domain/repositories/menu_repository.dart';
import 'package:meal_payment_app/src/features/menus/presentation/cubit/menus_cubit.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/widgets/vendors_menus_loaded.dart';

import '../../../../core/service_locator/service_locator.dart';

class VendorsMenusPage extends StatelessWidget {
  const VendorsMenusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(
        menuRepository: locator<MenuRepository>(),
      ),
      child: const VendorsMenusView(),
    );
  }
}

class VendorsMenusView extends StatefulWidget {
  const VendorsMenusView({super.key});

  @override
  State<VendorsMenusView> createState() => _VendorsMenusViewState();
}

class _VendorsMenusViewState extends State<VendorsMenusView> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().fetchMenusList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<MenuCubit, MenuState>(
            builder: (context, state) {
              if (state.status == MenuStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == MenuStatus.failure) {
                return Center(
                  child: Text('${state.errorMessage}'),
                );
              }
              return VendorsMenusLoaded(
                menus: state.menus.reversed.toList(),
                // constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
