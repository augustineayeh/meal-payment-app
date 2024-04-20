// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/core/dummy/models/meal.dart';
import 'package:meal_payment_app/src/core/dummy/pages/school_detail_page.dart';

class MealDetailPageDummy extends StatefulWidget {
  const MealDetailPageDummy({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  State<MealDetailPageDummy> createState() => _MealDetailPageDummyState();
}

class _MealDetailPageDummyState extends State<MealDetailPageDummy> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      widget.meal.imageUrl,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
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
                        widget.meal.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.meal.price}ghs',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text('Vendor: ${widget.meal.vendor}'),
                  const Gap(16),
                  const Text(
                    'Customize your order',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: widget.meal.contains.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.meal.contains[index],
                            ),
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    isChecked = !isChecked;
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Gap(24),
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
