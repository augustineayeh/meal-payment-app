// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/features/schools/domain/repositories/school_repository.dart';
import 'package:meal_payment_app/src/features/schools/presentation/cubit/schools_cubit.dart';
import 'package:meal_payment_app/src/features/students/presentation/pages/add_student_page.dart';
import 'package:meal_payment_app/src/features/students/presentation/pages/students_page.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/pages/add_vendor_page.dart';

import '../../../core/dummy/pages/school_detail_page.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../vendors/domain/repositories/vendor_repository.dart';
import '../../vendors/presentation/cubit/vendors_cubit.dart';
import '../../vendors/presentation/pages/vendors_page.dart';

class SchoolAdminHomePage extends StatelessWidget {
  const SchoolAdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              )
            ],
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SchoolCubit>(
            create: (context) => SchoolCubit(
              schoolRepository: locator<SchoolRepository>(),
            ),
          ),
          BlocProvider<VendorCubit>(
            create: (context) => VendorCubit(
              vendorRepository: locator<VendorRepository>(),
            ),
          ),
        ],
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/wallpaper.avif'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(40),
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
                  const Gap(200),
                  BlueButton(
                    text: 'View all vendors',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VendorsPage(),
                          ));
                    },
                  ),
                  const Gap(24),
                  BlueButton(
                    text: 'Add a vendor',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddVendorPage(),
                          ));
                    },
                  ),
                  const Gap(24),
                  BlueButton(
                    text: 'View all students',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentsPage(),
                          ));
                    },
                  ),
                  const Gap(24),
                  BlueButton(
                    text: 'Add a Student',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddStudentPage(),
                          ));
                    },
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}







// class MydropDown extends StatefulWidget {
//   const MydropDown({super.key});

//   @override
//   State<MydropDown> createState() => MydropDownState();
// }

// class MydropDownState extends State<MydropDown> {
//   final menuOptions = FirebaseRemoteConfigService().getMenuOptions();
//   String? selecetdSchool;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: double.infinity,
//       child: DropdownButtonFormField(
//         isExpanded: true,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(4),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         hint: Text(
//           selecetdSchool == null ? 'Amenities' : selecetdSchool.toString(),
//           style: selecetdSchool == null
//               ? Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     color: Theme.of(context)
//                         .colorScheme
//                         .onPrimary
//                         .withOpacity(0.5),
//                   )
//               : Theme.of(context).textTheme.bodyMedium,
//         ),
//         value: selecetdSchool,
//         onChanged: (String? newValue) {
//           setState(() {
//             selecetdSchool = newValue!;
//             print(selecetdSchool.toString());
//           });
//           context.read<VendorCubit>().onSchoolChanged(selecetdSchool!);
//         },
//         items: menuOptions.amenities
//             .map(
//               (item) => DropdownMenuItem(
//                 value: item,
//                 child: Text(item.toString()),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// class SelectSchoolDropDown extends StatefulWidget {
//   const SelectSchoolDropDown({super.key});

//   @override
//   State<SelectSchoolDropDown> createState() => _SelectSchoolDropDownState();
// }

// class _SelectSchoolDropDownState extends State<SelectSchoolDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return const NameTextField();
//   }
// }


// class EmailTextField extends StatelessWidget {
//   const EmailTextField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VendorCubit, VendorState>(
//       // buildWhen: (previous, current) => previous.email != current.email,
//       builder: (context, state) {
//         return TextField(
//           // keyboardType: TextInputType.emailAddress,
//           // style: Theme.of(context).textTheme.titleMedium?.copyWith(
//           //       color: Theme.of(context).colorScheme.onPrimary,
//           //     ),
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 10,
//             ),
//             hintText: 'Email',
//             hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color:
//                       Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
//                 ),
//             errorText:
//                 state.email.displayError != null ? 'Invalid Email' : null,
//             focusedBorder: OutlineInputBorder(
// borderSide: const Borde
//               //   color: ColorConsts.primaryColor,
//               // ),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             border: OutlineInputBorder(
//               // borderSide: BorderSide(
//               //   color: ColorConsts.grey.withOpacity(0.5),
//               // ),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           onChanged: (String value) =>
//               context.read<VendorCubit>().onEmailChanged(value),
//         );
//       },
//     );
//   }
// }
