import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import '../../../../common/widgets/flushbar.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/student_repository.dart';
import '../cubit/students_cubit.dart';

part '../widgets/create_student_button.dart';
part '../widgets/finger_print.dart';
part '../widgets/first_name_text_field.dart';
part '../widgets/last_name_text_field.dart';
part '../widgets/middle_name_text_field.dart';
part '../widgets/school_drop_down.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final school = context.select((VendorCubit bloc) => bloc.state.school);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
                StudentCubit(studentRepository: locator<StudentRepository>()),
            child: LayoutBuilder(builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),
                    const Text(
                      'Add a student',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const Gap(8),
                    const Text('First Name'),
                    const Gap(4),
                    const _FirstNameTextField(),
                    const Gap(20),
                    const Text('Middle name'),
                    const Gap(4),
                    const _MiddleNameTextField(),
                    const Gap(20),
                    const Text('Last Name'),
                    const Gap(4),
                    const _LastNameTextField(),
                    const Gap(20),
                    // const Text('School'),
                    // const Gap(4),
                    // const _LastNameTextField(),
                    // const _SchoolDropDown(),
                    // const Gap(20),
                    const Text('Fingerprint'),
                    const Gap(4),

                    const _FingerPrint(),
                    // const Gap(20),
                    // const Text('School'),
                    // const Gap(4),
                    // const SelectSchoolDropDown(),
                    const Gap(20),

                    // const EmailTextField(),
                    const Gap(32),
                    _CreateStudentButton(
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
