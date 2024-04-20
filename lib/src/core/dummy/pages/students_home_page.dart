import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/meal.dart';
import '../models/vendor.dart';
import 'meal_detail_page.dart';
import 'vendor_details_page.dart';

class StudentsHomePage extends StatelessWidget {
  const StudentsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vendors in my school',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: vendors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VendorDetailPageDummy(
                              vendor: vendors[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                vendors[index].imageUrl,
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Gap(20),
              const Text(
                'Popular meals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            builder: (context) => MealDetailPageDummy(
                              meal: meals[index],
                            ),
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
              SizedBox(
                height: 120,
                // width: 400,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: meals.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MealDetailPageDummy(meal: meals[index]),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.money),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
