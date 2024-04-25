// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/core/dummy/pages/school_detail_page.dart';
import 'package:meal_payment_app/src/features/schools/domain/entities/school.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/widgets/horizontal_vendors_list_view.dart';

class SchoolDetailsLoaded extends StatefulWidget {
  const SchoolDetailsLoaded({
    super.key,
    required this.school,
    required this.constraints,
  });

  final School school;
  final BoxConstraints constraints;

  @override
  State<SchoolDetailsLoaded> createState() => _SchoolDetailsLoadedState();
}

class _SchoolDetailsLoadedState extends State<SchoolDetailsLoaded> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.school.image ??
                          'https://e7.pngegg.com/pngimages/759/202/png-clipart-education-school-logo-learning-teaching-angle-class.png',
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // CachedNetworkImage(
            //   imageUrl: widget.school.image ??
            //       'https://e7.pngegg.com/pngimages/759/202/png-clipart-education-school-logo-learning-teaching-angle-class.png',
            //   fit: BoxFit.cover,
            //   errorWidget: (context, _, __) => const SizedBox(
            //     height: 300,
            //     width: 300,
            //     child: Center(
            //       child: Text('No Image'),
            //     ),
            //   ),
            // ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.school.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Gap(12),
                  Text('Phone: ${widget.school.phoneNumber}'),
                  const Gap(12),
                  Text('Email: ${widget.school.email}'),
                  const Gap(12),
                  Text('Location: ${widget.school.location}'),
                  const Gap(16),
                  const Text(
                    'Vendors in this school',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Gap(24),
                  const HorizontalVendorsList(),
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
            text: 'Suspend this school',
            onPressed: () {},
          ),
        ),
      ),
    ]);
  }
}
