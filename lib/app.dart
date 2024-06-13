import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'src/core/dummy/pages/school_detail_page.dart';
import 'src/features/admins/app_admin/app_admin_home_page.dart';
import 'src/features/admins/school_admin/school_admin_home_page.dart';
import 'src/features/students/presentation/pages/student_home_page.dart';

import 'src/core/service_locator/service_locator.dart';
import 'src/features/auth/domain/repository/repository.dart';
import 'src/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'src/features/schools/domain/repositories/school_repository.dart';
import 'src/features/schools/presentation/cubit/schools_cubit.dart';
import 'src/features/vendors/domain/repositories/vendor_repository.dart';
import 'src/features/vendors/presentation/cubit/vendors_cubit.dart';
import 'src/features/vendors/presentation/pages/vendor_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SchoolCubit>(
          create: (context) => SchoolCubit(
            schoolRepository: locator<SchoolRepository>(),
          ),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(
            authenticationRepository: locator<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<VendorCubit>(
          create: (context) => VendorCubit(
            vendorRepository: locator<VendorRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal payment app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(200),
              BlueButton(
                text: 'App admin',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppAdminHomePage(),
                      ));
                },
              ),
              const Gap(45),
              BlueButton(
                text: 'School admin',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SchoolAdminHomePage(),
                      ));
                },
              ),
              const Gap(45),
              BlueButton(
                text: 'Student',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentHomePage(),
                      ));
                },
              ),
              const Gap(45),
              BlueButton(
                text: 'Vendor',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VendorHomePage(),
                      ));
                },
              ),
              const Gap(45),
            ],
          ),
        ),
      ),
    );
  }
}
