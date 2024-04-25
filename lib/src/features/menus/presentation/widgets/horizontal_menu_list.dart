import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../domain/entities/menu.dart';
import '../../domain/repositories/menu_repository.dart';
import '../pages/menu_details_page.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../cubit/menus_cubit.dart';

class HorizontalMenuList extends StatelessWidget {
  const HorizontalMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(menuRepository: locator<MenuRepository>()),
      child: const HorizontalMenuListView(),
    );
  }
}

class HorizontalMenuListView extends StatefulWidget {
  const HorizontalMenuListView({super.key});

  @override
  State<HorizontalMenuListView> createState() => _HorizontalMenuListViewState();
}

class _HorizontalMenuListViewState extends State<HorizontalMenuListView> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().fetchMenusList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) {
            if (state.status == MenuStatus.success) {
              if (state.menus.isEmpty) {
                return const Center(
                  child: Text('No menus have been registered yet'),
                );
              }
              return _HorizontalMenuListViewLoaded(
                menus: state.menus.reversed.toList(),
                constraints: constraints,
              );
            } else if (state.status == MenuStatus.loading) {
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

class _HorizontalMenuListViewLoaded extends StatelessWidget {
  const _HorizontalMenuListViewLoaded({
    super.key,
    required this.menus,
    required this.constraints,
  });

  final List<Menu> menus;
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
                  itemCount: menus.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuDetailsPage(
                                menuId: menus[index].id,
                              ),
                            ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          menus[index].image != null
                              ? Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        menus[index].image!,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                )
                              :
                          Image.asset(
                            'assets/food.png',
                            height: 80,
                          ),
                          const Gap(8),
                          Text(menus[index].name),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // if (menus.length > 3)
              //   Opacity(
              //     opacity: 0.5,
              //     child: GestureDetector(
              //       onTap: () {
              //         // Navigator.push(
              //         //     context,
              //         //     MaterialPageRoute(
              //         //       builder: (context) => const MenuPage(),
              //         //     ));
              //       },
              //       child: Container(
              //         height: 130,
              //         width: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           image: DecorationImage(
              //             fit: BoxFit.cover,
              //             image: NetworkImage(menus[3].image!),
              //           ),
              //           borderRadius: BorderRadius.circular(30),
              //         ),
              //         child: const Center(
              //           child: Text(
              //             'View all',
              //             style: TextStyle(
              //                 color: Colors.white, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ],
      ),
    );
  }
}
