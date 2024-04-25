import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/features/menus/domain/entities/menu.dart';
import 'package:meal_payment_app/src/features/menus/presentation/pages/menu_details_page.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/widgets/horizontal_vendors_list_view_2.dart';

class MenusLoaded extends StatelessWidget {
  const MenusLoaded({
    super.key,
    required this.menus,
  });

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Vendors in your school",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const HorizontalVendorsList2(),
            const Text(
              "Select a meal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: menus.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MenuDetailsPage(menuId: menus[index].id),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        menus[index].image == null
                            ? Expanded(
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/food.png',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          menus[index].image!,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menus[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${menus[index].price}GHS'),
                              // Text(menus[index].!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
