// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/core/dummy/pages/school_detail_page.dart';
import 'package:meal_payment_app/src/core/service_locator/service_locator.dart';
import 'package:meal_payment_app/src/features/students/domain/repositories/student_repository.dart';
import 'package:meal_payment_app/src/features/students/presentation/cubit/students_cubit.dart';
import 'package:meal_payment_app/src/features/students/presentation/widgets/student_details_loaded.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({
    super.key,
    required this.studentId,
  });

  final String studentId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(
        studentRepository: locator<StudentRepository>(),
      ),
      child: StudentDetailsView(
        studentId: studentId,
      ),
    );
  }
}

class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({
    super.key,
    required this.studentId,
  });

  final String studentId;

  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}

class _StudentDetailsViewState extends State<StudentDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<StudentCubit>().fetchSingleStudent(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
              if (state.status == StudentStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == StudentStatus.failure) {
                return Center(
                  child: Text('An error occurred: ${state.errorMessage}'),
                );
              }
              return StudentDetailsLoaded(
                student: state.student,
                constraints: constraints,
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
        child: BlueButton(
          text: 'Suspend this student',
          onPressed: () {},
        ),
      ),
    );
  }
}
