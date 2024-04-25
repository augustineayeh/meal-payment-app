
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/core/dummy/pages/school_detail_page.dart';
import 'package:meal_payment_app/src/features/menus/domain/entities/menu.dart';
import 'package:meal_payment_app/src/features/vendors/presentation/pages/vendor_details_page.dart';

class MenuDetailsLoaded extends StatefulWidget {
  const MenuDetailsLoaded({
    super.key,
    required this.menu,
  });
  final Menu menu;

  @override
  State<MenuDetailsLoaded> createState() => _MenuDetailsLoadedState();
}

class _MenuDetailsLoadedState extends State<MenuDetailsLoaded> {
  String? selectedItem;

  bool isShowMoreClicked = false;
  // late List<String> items = menu.de;
  List<dynamic> selectedItems = [];

  void onItemSelected(bool selected, String item) {
    if (selected) {
      setState(() {
        selectedItems.add(item);
      });
    } else {
      setState(() {
        selectedItems.remove(item);
      });
    }
    // context.read<MenuCubit>().onDetailsChanged(selectedItems.add());
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.menu.image != null
                ? Container(
                    height: 400,

                    // width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // fit: BoxFit.none,
                        image: NetworkImage(
                          widget.menu.image!,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/food.png'),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.menu.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VendorDetailsPage(
                                      vendorId: widget.menu.vendorId),
                                ));
                          },
                          child: const Text('View vendor')),
                      Text(
                        '${widget.menu.price}ghs',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Gap(16),
                  const Text(
                    'Customize your order',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.menu.details.length,
                      itemBuilder: (context, index) {
                        selectedItem = widget.menu.details[index]['name'];
                        return CheckboxListTile(
                          // checkColor: ColorConsts.white,
                          title: Text(selectedItem ?? ''),
                          value: selectedItems
                              .contains(widget.menu.details[index]),
                          onChanged: (bool? selected) {
                            onItemSelected(
                                selected!, widget.menu.details[index]);
                          },
                        );
                      },
                    ),
                  ),

                  // SizedBox(
                  //   height: 300,
                  //   child: ListView.builder(
                  //     padding: EdgeInsets.zero,
                  //     itemCount: widget.menu.details.length,
                  //     itemBuilder: (context, index) {
                  //       return Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Expanded(
                  //               child:
                  //                   Text(widget.menu.details[index]['name'])),
                  //           Expanded(
                  //             child: Text(
                  //                 '${widget.menu.details[index]['price']}'),
                  //           ),
                  //           Checkbox(
                  //             value: isChecked,
                  //             onChanged: (bool? value) {
                  //               setState(
                  //                 () {
                  //                   isChecked = !isChecked;
                  //                 },
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                  const Gap(24),
                  // const MealDetailCheck(),
                  BlueButton(text: 'Place an order', onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
