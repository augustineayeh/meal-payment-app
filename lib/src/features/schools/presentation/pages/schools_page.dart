import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/school_repository.dart';
import '../cubit/schools_cubit.dart';
import '../widgets/schools_loaded.dart';

class SchoolsPage extends StatelessWidget {
  const SchoolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SchoolCubit(
        schoolRepository: locator<SchoolRepository>(),
      ),
      child: const SchoolsViewNew(),
    );
  }
}

class SchoolsViewNew extends StatefulWidget {
  const SchoolsViewNew({super.key});

  @override
  State<SchoolsViewNew> createState() => _SchoolsViewNewState();
}

class _SchoolsViewNewState extends State<SchoolsViewNew> {
  @override
  void initState() {
    super.initState();
    context.read<SchoolCubit>().fetchSchoolsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Schools'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<SchoolCubit, SchoolState>(
            builder: (context, state) {
              if (state.status == SchoolStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == SchoolStatus.failure) {
                return Center(
                  child: Text('${state.errorMessage}'),
                );
              }
              return SchoolsLoaded(
                schools: state.schools.reversed.toList(),
                // constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
