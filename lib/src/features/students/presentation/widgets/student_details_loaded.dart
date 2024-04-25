// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/features/students/domain/entities/student.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/widgets/horizontal_vendors_list_view.dart';

class StudentDetailsLoaded extends StatefulWidget {
  const StudentDetailsLoaded({
    super.key,
    required this.student,
    required this.constraints,
  });

  final Student student;
  final BoxConstraints constraints;

  @override
  State<StudentDetailsLoaded> createState() => _StudentDetailsLoadedState();
}

class _StudentDetailsLoadedState extends State<StudentDetailsLoaded> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student information',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Orders',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Gap(14),
            HorizontalVendorsList(),
            Gap(300),
          ],
        ),
      ),
    );
  }
}
