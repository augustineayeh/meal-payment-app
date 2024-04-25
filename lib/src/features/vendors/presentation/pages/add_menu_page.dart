import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../menus/domain/repositories/menu_repository.dart';
import '../../../menus/presentation/cubit/menus_cubit.dart';

import '../../../../core/service_locator/service_locator.dart';


class AddMenuPage extends StatelessWidget {
  const AddMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
                MenuCubit(menuRepository: locator<MenuRepository>()),
            child: LayoutBuilder(builder: (context, constraints) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(40),
                    Text(
                      'Add a Menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Gap(8),
                    Text('Name'),
                    Gap(4),
                    // const _NameTextField(),
                    // const Gap(20),
                    // const Text('Location'),
                    // const Gap(4),
                    // const _LocationTextField(),
                    // const Gap(20),
                    // const Text('Phone'),
                    // const Gap(4),
                    // const _PhoneNumberTextField(),
                    // const Gap(20),
                    // const Text('Email'),
                    // const Gap(4),
                    // const _EmailTextField(),
                    // const Gap(48),
                    // _CreateMenuButton(
                    //   constraints: constraints,
                    // )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
