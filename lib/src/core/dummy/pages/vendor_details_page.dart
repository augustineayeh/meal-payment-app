// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/core/dummy/models/meal.dart';
import 'package:meal_payment_app/src/core/dummy/models/vendor.dart';
import 'package:meal_payment_app/src/core/dummy/pages/meal_detail_page.dart';

class VendorDetailPage extends StatelessWidget {
  const VendorDetailPage({
    super.key,
    required this.vendor,
  });

  final Vendor vendor;
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
                      vendor.imageUrl,
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
                        vendor.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Gap(150),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.star),
                          title: Text(
                            vendor.rating.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Text(
                    vendor.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    vendor.phone,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(24),
                  const Text(
                    'This week\'s menu',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Gap(12),
                  SizedBox(
                    height: 120,
                    // width: 400,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: meals.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MealDetailPage(meal: meals[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              // height: 100,
                              width: 170,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        meals[index].imageUrl,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(60),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Give this vendor a tip',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  const Gap(30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade900,
                          foregroundColor: Colors.white),
                      child: const Text('Delete vendor'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
