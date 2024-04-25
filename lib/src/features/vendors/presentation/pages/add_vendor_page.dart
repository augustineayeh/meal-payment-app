import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import '../../../../common/widgets/flushbar.dart';
import '../../../schools/domain/entities/school.dart';
import '../cubit/vendors_cubit.dart';

part '../widgets/create_vendor_button.dart';
part '../widgets/location_text_field.dart';
part '../widgets/name_text_field.dart';
part '../widgets/phone_number_text_field.dart';

class AddVendorPage extends StatelessWidget {
  const AddVendorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final school = context.select((VendorCubit bloc) => bloc.state.school);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(40),
                  const Text(
                    'Add a vendor',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const Gap(8),
                  const Text('Name'),
                  const _NameTextField(),
                  const Gap(20),
                  const Text('Phone'),
                  const Gap(4),
                  const _PhoneNumberTextField(),
                  const Gap(20),
                  const Text('Location'),
                  const Gap(4),
                  const _LocationTextField(),
                  const Gap(20),

                  // const Gap(20),
                  // const Text('School'),
                  // const Gap(4),
                  // const SelectSchoolDropDown(),
                  const Gap(20),

                  // const EmailTextField(),
                  const Gap(48),
                  _CreateVendorButton(
                    constraints: constraints,
                    school: school,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
