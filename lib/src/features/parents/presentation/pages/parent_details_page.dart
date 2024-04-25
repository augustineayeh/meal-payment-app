// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_payment_app/src/core/service_locator/service_locator.dart';
import 'package:meal_payment_app/src/features/parents/domain/repositories/parent_repository.dart';
import 'package:meal_payment_app/src/features/parents/presentation/cubit/parents_cubit.dart';
import 'package:meal_payment_app/src/features/parents/presentation/widgets/parent_details_loaded.dart';

class ParentDetailsPage extends StatelessWidget {
  const ParentDetailsPage({
    super.key,
    required this.parentId,
  });

  final String parentId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentCubit(
        parentRepository: locator<ParentRepository>(),
      ),
      child: ParentDetailsView(
        parentId: parentId,
      ),
    );
  }
}

class ParentDetailsView extends StatefulWidget {
  const ParentDetailsView({
    super.key,
    required this.parentId,
  });

  final String parentId;

  @override
  State<ParentDetailsView> createState() => _ParentDetailsViewState();
}

class _ParentDetailsViewState extends State<ParentDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<ParentCubit>().fetchSingleParent(widget.parentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<ParentCubit, ParentState>(
            builder: (context, state) {
              if (state.status == ParentStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == ParentStatus.failure) {
                return const Center(
                  child: Text('An error occurred'),
                );
              }
              return ParentDetailsLoaded(
                parent: state.parent,
                constraints: constraints,
              );
            },
          );
        },
      ),
    );
  }
}
