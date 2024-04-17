// ignore_for_file: public_member_api_docs, sort_constructors_first
class School {
  final String name;
  final String imageUrl;
  final String location;
  School({
    required this.name,
    required this.imageUrl,
    required this.location,
  });
}

final List<School> schools = [
  School(
      name: 'Queensland Int. School',
      imageUrl: 'assets/school1.avif',
      location: 'Tema'),
  School(
    name: 'Datus School',
    imageUrl: 'assets/school2.avif',
    location: 'Dansoman',
  ),
  School(
      name: 'St. Paul\'s School',
      imageUrl: 'assets/school3.avif',
      location: 'Adenta'),
  School(
      name: 'British Int School',
      imageUrl: 'assets/school4.avif',
      location: 'East Airport'),
  School(
      name: 'Tema Int. School',
      imageUrl: 'assets/school5.avif',
      location: 'Tema'),
  School(
      name: 'Ghana Int. School',
      imageUrl: 'assets/school6.avif',
      location: 'Cantoment'),
];
