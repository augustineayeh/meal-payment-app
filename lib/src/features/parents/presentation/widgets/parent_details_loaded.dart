import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import '../../../../core/dummy/pages/school_detail_page.dart';
import '../../domain/entities/parent.dart';

// * to continue later

class ParentDetailsLoaded extends StatefulWidget {
  const ParentDetailsLoaded({
    super.key,
    required this.parent,
    required this.constraints,
  });

  final Parent parent;
  final BoxConstraints constraints;

  @override
  State<ParentDetailsLoaded> createState() => _ParentDetailsLoadedState();
}

class _ParentDetailsLoadedState extends State<ParentDetailsLoaded> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.parent.fullName,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Gap(12),
                  const Gap(12),
                  Text('Location: ${widget.parent.location}'),
                  const Gap(16),
                  const Gap(24),
                ],
              ),
            ),
            const Gap(300),
          ],
        ),
      ),
      Positioned(
        bottom: 24,
        child: Container(
          height: 60,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlueButton(
            text: 'Suspend this parent',
            onPressed: () {},
          ),
        ),
      ),
    ]);
  }
}
