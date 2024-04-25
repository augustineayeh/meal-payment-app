import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/student.dart';
import '../cubit/students_cubit.dart';
import '../pages/student_details_page.dart';

class StudentsLoaded extends StatefulWidget {
  const StudentsLoaded({
    super.key,
    required this.students,
  });

  final List<Student> students;

  @override
  State<StudentsLoaded> createState() => _StudentsLoadedState();
}

class _StudentsLoadedState extends State<StudentsLoaded> {
  Future<void> _refresh() async {
    context.read<StudentCubit>().fetchStudentsList();
    Future.delayed(
      const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: widget.students.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsPage(
                        studentId: widget.students[index].id!,
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${widget.students[index].firstName!.toUpperCase()} ${widget.students[index].lastName!.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
