// ignore_for_file: public_member_api_docs, sort_constructors_first
class VendorDummy {
  final String name;
  final String school;
  final String imageUrl;
  final String phone;
  final String email;
  final double rating;
  final List menu;
  VendorDummy({
    required this.name,
    required this.school,
    required this.imageUrl,
    required this.phone,
    required this.email,
    required this.rating,
    required this.menu,
  });
}

final List<VendorDummy> vendors = [
  VendorDummy(
    name: 'Alice Ababio',
    school: 'Ghana Int. School',
    imageUrl: 'assets/VendorDummy3.avif',
    rating: 4.4,
    email: 'alice123@gmail.com',
    phone: '0241234567',
    menu: [
      'Jollof & Chicken - 15gh',
      'Waakye, Salad & Meat',
      'Beans & Platain',
      'Solobo & Meatpie',
    ],
  ),
  VendorDummy(
    name: 'Alice Ababio',
    school: 'Tema Int. School',
    imageUrl: 'assets/VendorDummy1.avif',
    rating: 4.4,
    email: 'alice123@gmail.com',
    phone: '0241234567',
     menu: [
      'Jollof & Chicken - 15gh',
      'Waakye, Salad & Meat',
      'Beans & Platain',
      'Solobo & Meatpie',
    ],
  ),
  VendorDummy(
    name: 'Alice Ababio',
    school: 'British Int. School',
    imageUrl: 'assets/VendorDummy4.avif',
    rating: 4.4,
    email: 'alice123@gmail.com',
    phone: '0241234567',
     menu: [
      'Jollof & Chicken - 15gh',
      'Waakye, Salad & Meat',
      'Beans & Platain',
      'Solobo & Meatpie',
    ],
  ),
  VendorDummy(
    name: 'Alice Ababio',
    school: 'Tepas School',
    imageUrl: 'assets/VendorDummy2.avif',
    rating: 4.4,
    email: 'alice123@gmail.com',
    phone: '0241234567',
     menu: [
      'Jollof & Chicken - 15gh',
      'Waakye, Salad & Meat',
      'Beans & Platain',
      'Solobo & Meatpie',
    ],
  ),
  VendorDummy(
    name: 'Alice Ababio',
    school: 'Galaxy Int. School',
    imageUrl: 'assets/VendorDummy5.avif',
    rating: 4.4,
    email: 'alice123@gmail.com',
    phone: '0241234567',
     menu: [
      'Jollof & Chicken - 15gh',
      'Waakye, Salad & Meat',
      'Beans & Platain',
      'Solobo & Meatpie',
    ],
  )
];
