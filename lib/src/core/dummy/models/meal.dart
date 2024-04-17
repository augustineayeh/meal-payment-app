// ignore_for_file: public_member_api_docs, sort_constructors_first
class Meal {
  final String name;
  final int price;
  final String vendor;
  final String imageUrl;
  final List<String> contains;
  Meal({
    required this.name,
    required this.price,
    required this.vendor,
    required this.imageUrl,
    required this.contains,
  });
}

final List<Meal> meals = [
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/jollof.webp',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/rice.avif',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/rice2.avif',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/fried_rice.avif',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/jollof.webp',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/rice.avif',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/rice2.avif',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  ),
  Meal(
    name: 'Jollof & chicken',
    price: 15,
    vendor: 'Alice Poku',
    imageUrl: 'assets/fried_rice.avif',
    contains: [
      'Gari',
      'Spaghetti',
      'Salad',
      'Fish',
      'Meat',
      'Egg',
    ],
  )
];
