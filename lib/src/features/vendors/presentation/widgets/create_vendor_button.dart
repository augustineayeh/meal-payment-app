part of '../pages/add_vendor_page.dart';

class _CreateVendorButton extends StatelessWidget {
  const _CreateVendorButton({
    super.key,
    required this.constraints,
    required this.school,
  });
  final BoxConstraints constraints;
  final School school;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VendorCubit, VendorState>(
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
        child: BlocBuilder<VendorCubit, VendorState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white),
              onPressed: !state.isValid
                  ? null
                  : () => context.read<VendorCubit>().createVendor(school),
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
                          'Add vendor',
                          // style:
                          //     Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //           color: ColorConsts.white,
                          //         ),
                        ),
                      ],
                    )
                  : const Text(
                      'Add vendor',
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
