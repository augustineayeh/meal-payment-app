import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dummy/pages/school_detail_page.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/student_repository.dart';
import '../cubit/students_cubit.dart';
import '../widgets/students_loaded.dart';
import 'add_student_page.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(
        studentRepository: locator<StudentRepository>(),
      ),
      child: const StudentsView(),
    );
  }
}

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  @override
  void initState() {
    super.initState();
    context.read<StudentCubit>().fetchStudentsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text('Students'),
        ),
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
                    child: Text('${state.errorMessage}'),
                  );
                }
                return StudentsLoaded(
                  students: state.students,
                  // constraints: constraints,
                );
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
          child: BlueButton(
            text: 'Add a student',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddStudentPage(),
                ),
              );
            },
          ),
        ));
  }
}
