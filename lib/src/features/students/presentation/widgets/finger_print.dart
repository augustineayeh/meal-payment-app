part of '../pages/add_student_page.dart';

class _FingerPrint extends StatelessWidget {
  const _FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Image.asset(
        'assets/fingerprint.png',
        height: 100,
        width: 100,
      ),
    );
  }
}
