import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../vendors/presentation/cubit/vendors_cubit.dart';

class AddParentPage extends StatelessWidget {
  const AddParentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final school = context.select((VendorCubit bloc) => bloc.state.school);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40),
                  Text(
                    'Add a vendor',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  Gap(8),
                  Text('Name'),
                  Gap(4),
                  // const NameTextField(),
                  Gap(20),
                  Text('Location'),
                  Gap(4),
                  // const LocationTextField(),
                  Gap(20),
                  Text('Phone'),
                  Gap(4),
                  // const PhoneNumberTextField(),
                  // const Gap(20),
                  // const Text('School'),
                  // const Gap(4),
                  // const SelectSchoolDropDown(),
                  Gap(20),

                  // const EmailTextField(),
                  Gap(48),
                  // CreateVendorButton(
                  //   constraints: constraints,
                  //   school: school,
                  // )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
