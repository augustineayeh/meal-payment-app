// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/features/menus/presentation/widgets/menu_loaded.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/menu_repository.dart';
import '../cubit/menus_cubit.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(
        menuRepository: locator<MenuRepository>(),
      ),
      child: const MenusViewNew(),
    );
  }
}

class MenusViewNew extends StatefulWidget {
  const MenusViewNew({super.key});

  @override
  State<MenusViewNew> createState() => _MenusViewNewState();
}

class _MenusViewNewState extends State<MenusViewNew> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().fetchMenusList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                return MenusLoaded(
                  menus: state.menus.reversed.toList(),
                  // constraints: constraints,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
