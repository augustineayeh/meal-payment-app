import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';

import '../../../../common/widgets/flushbar.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/school_repository.dart';
import '../cubit/schools_cubit.dart';

part '../widgets/create_school_button.dart';
part '../widgets/email_text_field.dart';
part '../widgets/location_text_field.dart';
part '../widgets/name_text_field.dart';
part '../widgets/phone_number_text_field.dart';

class AddSchoolPage extends StatelessWidget {
  const AddSchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
                SchoolCubit(schoolRepository: locator<SchoolRepository>()),
            child: LayoutBuilder(builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),
                    const Text(
                      'Add a school',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const Gap(8),
                    const Text('Name'),
                    const Gap(4),
                    const _NameTextField(),
                    const Gap(20),
                    const Text('Location'),
                    const Gap(4),
                    const _LocationTextField(),
                    const Gap(20),
                    const Text('Phone'),
                    const Gap(4),
                    const _PhoneNumberTextField(),
                    const Gap(20),
                    const Text('Email'),
                    const Gap(4),
                    const _EmailTextField(),
                    const Gap(48),
                    _CreateSchoolButton(
                      constraints: constraints,
                    )
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
