// ignore_for_file: public_member_api_docs, sort_constructors_first
class SchoolDummy {
  final String name;
  final String imageUrl;
  final String location;
  SchoolDummy({
    required this.name,
    required this.imageUrl,
    required this.location,
  });
}

final List<SchoolDummy> schools = [
  SchoolDummy(
      name: 'Queensland Int. SchoolDummy',
      imageUrl: 'assets/school1.avif',
      location: 'Tema'),
  SchoolDummy(
    name: 'Datus SchoolDummy',
    imageUrl: 'assets/school2.avif',
    location: 'Dansoman',
  ),
  SchoolDummy(
      name: 'St. Paul\'s SchoolDummy',
      imageUrl: 'assets/school3.avif',
      location: 'Adenta'),
  SchoolDummy(
      name: 'British Int SchoolDummy',
      imageUrl: 'assets/school4.avif',
      location: 'East Airport'),
  SchoolDummy(
      name: 'Tema Int. SchoolDummy',
      imageUrl: 'assets/school5.avif',
      location: 'Tema'),
  SchoolDummy(
      name: 'Ghana Int. SchoolDummy',
      imageUrl: 'assets/school6.avif',
      location: 'Cantoment'),
];
