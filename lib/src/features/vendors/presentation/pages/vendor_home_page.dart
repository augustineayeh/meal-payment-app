import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'add_menu_page.dart';

import '../../../../core/dummy/pages/school_detail_page.dart';
import '../../../orders/presentation/pages/orders_page.dart';
import 'vendors_menus_page.dart';

class VendorHomePage extends StatelessWidget {
  const VendorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/wallpaper2.avif'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(160),
                const Text('Welcome, vendor!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 48)),
                const Gap(24),
                const Text('Select an action to continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                const Gap(300),
                BlueButton(
                  text: 'View my orders',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrdersPage(),
                        ));
                  },
                ),
                const Gap(24),
                BlueButton(
                  text: 'View my menu(s)',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VendorsMenusPage(),
                        ));
                  },
                ),
                const Gap(24),
                BlueButton(
                  text: 'Add a menu',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddMenuPage(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
