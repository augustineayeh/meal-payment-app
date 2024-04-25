// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/core/dummy/pages/school_detail_page.dart';
import 'package:meal_payment_app/src/features/menus/presentation/widgets/horizontal_menu_list.dart';
import 'package:meal_payment_app/src/features/vendors/domain/entities/vendor.dart';

class VendorDetailsLoaded extends StatefulWidget {
  const VendorDetailsLoaded({
    super.key,
    required this.vendor,
    required this.constraints,
  });

  final Vendor vendor;
  final BoxConstraints constraints;

  @override
  State<VendorDetailsLoaded> createState() => _VendorDetailsLoadedState();
}

class _VendorDetailsLoadedState extends State<VendorDetailsLoaded> {
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
                      widget.vendor.image ??
                          'https://e7.pngegg.com/pngimages/759/202/png-clipart-education-vendor-logo-learning-teaching-angle-class.png',
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // CachedNetworkImage(
            //   imageUrl: widget.vendor.image ??
            //       'https://e7.pngegg.com/pngimages/759/202/png-clipart-education-vendor-logo-learning-teaching-angle-class.png',
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
                    widget.vendor.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Gap(12),
                  Text('Phone: ${widget.vendor.phoneNumber}'),
                  const Gap(4),
                  Text('Location: ${widget.vendor.location}'),
                  const Gap(16),
                  const Text(
                    'Menu',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  const HorizontalMenuList(),
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
            text: 'Suspend this vendor',
            onPressed: () {},
          ),
        ),
      ),
    ]);
  }
}
