// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_payment_app/src/core/dummy/models/meal.dart';
import 'package:meal_payment_app/src/core/dummy/models/school.dart';
import 'package:meal_payment_app/src/core/dummy/pages/meal_detail_page.dart';
import 'package:meal_payment_app/src/core/dummy/pages/vendors_page.dart';

class SchoolDetailPage extends StatefulWidget {
  const SchoolDetailPage({
    super.key,
    required this.school,
  });

  final SchoolDummy school;

  @override
  State<SchoolDetailPage> createState() => _SchoolDetailPageState();
}

class _SchoolDetailPageState extends State<SchoolDetailPage> {
  bool showMeals = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showMeals ? const MealsView() : const VendorsView(),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: BlueButton(
                      text: 'Meals',
                      onPressed: () {
                        setState(() {
                          showMeals = true;
                        });
                      },
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: WhiteButton(
                      text: 'Vendors',
                      onPressed: () {
                        setState(
                          () {
                            showMeals = false;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Gap(400),
            ],
          ),
        ),
      ),
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Meals available in this school',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 690,
          child: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MealDetailPageDummy(meal: meals[index]),
                      ));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: 170,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    meals[index].imageUrl,
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meals[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${meals[index].price}GHS'),
                              Text(meals[index].vendor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue.shade900),
        child: Text(text),
      ),
    );
  }
}
