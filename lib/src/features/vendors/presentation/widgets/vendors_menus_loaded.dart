import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/features/menus/domain/entities/menu.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/pages/edit_menu_page.dart';

class VendorsMenusLoaded extends StatelessWidget {
  const VendorsMenusLoaded({
    super.key,
    required this.menus,
  });

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your menu(s)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Gap(24),
              ListView.builder(
                shrinkWrap: true,
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditMenuPage(),
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            menus[index].image == null
                                ? Container(
                                    height: 120,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/food.png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                : Container(
                                    height: 120,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            menus[index].image!,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
