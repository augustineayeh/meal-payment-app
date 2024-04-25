import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/dummy/pages/school_detail_page.dart';
import '../../schools/presentation/pages/add_school_page.dart';
import '../../schools/presentation/pages/schools_page.dart';

class AppAdminHomePage extends StatelessWidget {
  const AppAdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        width: 340,
        child: SafeArea(
          child: Column(
            children: [
              Gap(60),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(
                  'Security',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(
                  'Payments',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/wallpaper4.avif'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(160),
                const Text('Welcome, admin!',
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
                  text: 'View all schools',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SchoolsPage(),
                        ));
                  },
                ),
                const Gap(24),
                BlueButton(
                  text: 'Add a school',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddSchoolPage(),
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
