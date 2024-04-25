part of '../pages/add_student_page.dart';

class _CreateStudentButton extends StatelessWidget {
  const _CreateStudentButton({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state.formStatus == FormzSubmissionStatus.failure) {
          showFlushSnackbar3(
            context: context,
            message: state.errorMessage ?? 'Unknown Error',
            isResponseSuccessful: false,
            duration: const Duration(seconds: 3),
          );
        } else if (state.formStatus == FormzSubmissionStatus.success) {
          showFlushSnackbar3(
            context: context,
            message: 'Success',
            isResponseSuccessful: true,
            duration: const Duration(seconds: 3),
          );
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.pop(context);
          });
        }
      },
      child: SizedBox(
        height: 50,
        width: constraints.maxWidth,
        child: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white),
              onPressed: !state.isValid
                  ? null
                  : () => context.read<StudentCubit>().createStudent(),
              child: state.formStatus == FormzSubmissionStatus.inProgress
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(
                            // color: ColorConsts.grey,
                            ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Add student',
                          // style:
                          //     Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //           color: ColorConsts.white,
                          //         ),
                        ),
                      ],
                    )
                  : const Text(
                      'Add student',
                      // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      //       color: ColorConsts.white,
                      //     ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
