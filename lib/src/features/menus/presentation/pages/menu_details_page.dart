// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/core/service_locator/service_locator.dart';
import 'package:meal_payment_app/src/features/menus/domain/repositories/menu_repository.dart';
import 'package:meal_payment_app/src/features/menus/presentation/cubit/menus_cubit.dart';
import 'package:meal_payment_app/src/features/menus/presentation/widgets/menu_details_loaded.dart';

class MenuDetailsPage extends StatelessWidget {
  const MenuDetailsPage({
    super.key,
    required this.menuId,
  });

  final String menuId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(
        menuRepository: locator<MenuRepository>(),
      ),
      child: MenuDetailsView(
        menuId: menuId,
      ),
    );
  }
}

class MenuDetailsView extends StatefulWidget {
  const MenuDetailsView({
    super.key,
    required this.menuId,
  });

  final String menuId;

  @override
  State<MenuDetailsView> createState() => _MenuDetailsViewState();
}

class _MenuDetailsViewState extends State<MenuDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().fetchSingleMenu(widget.menuId);
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
                return const Center(
                  child: Text('An error occurred'),
                );
              }
              return MenuDetailsLoaded(
                menu: state.menu,
                // constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
