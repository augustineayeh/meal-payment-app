// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/core/service_locator/service_locator.dart';
import 'package:meal_payment_app/src/features/schools/domain/repositories/school_repository.dart';
import 'package:meal_payment_app/src/features/schools/presentation/cubit/schools_cubit.dart';
import 'package:meal_payment_app/src/features/schools/presentation/widgets/school_details_loaded.dart';

class SchoolDetailsPage extends StatelessWidget {
  const SchoolDetailsPage({
    super.key,
    required this.schoolId,
  });

  final String schoolId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SchoolCubit(
        schoolRepository: locator<SchoolRepository>(),
      ),
      child: SchoolDetailsView(
        schoolId: schoolId,
      ),
    );
  }
}

class SchoolDetailsView extends StatefulWidget {
  const SchoolDetailsView({
    super.key,
    required this.schoolId,
  });

  final String schoolId;

  @override
  State<SchoolDetailsView> createState() => _SchoolDetailsViewState();
}

class _SchoolDetailsViewState extends State<SchoolDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<SchoolCubit>().fetchSingleSchool(widget.schoolId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<SchoolCubit, SchoolState>(
            builder: (context, state) {
              if (state.status == SchoolStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == SchoolStatus.failure) {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
              return SchoolDetailsLoaded(
                school: state.school,
                constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
