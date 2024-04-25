import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/parent_repository.dart';
import '../cubit/parents_cubit.dart';
import '../widgets/parents_loaded.dart';

class ParentsPage extends StatelessWidget {
  const ParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentCubit(
        parentRepository: locator<ParentRepository>(),
      ),
      child: const ParentsViewNew(),
    );
  }
}

class ParentsViewNew extends StatefulWidget {
  const ParentsViewNew({super.key});

  @override
  State<ParentsViewNew> createState() => _ParentsViewNewState();
}

class _ParentsViewNewState extends State<ParentsViewNew> {
  @override
  void initState() {
    super.initState();
    context.read<ParentCubit>().fetchParentsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Parents'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<ParentCubit, ParentState>(
            builder: (context, state) {
              if (state.status == ParentStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == ParentStatus.failure) {
                return Center(
                  child: Text('${state.errorMessage}'),
                );
              }
              return ParentsLoaded(
                parents: state.parents,
                // constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
