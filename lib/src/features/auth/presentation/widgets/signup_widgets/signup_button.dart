part of '../../pages/signup_screen.dart';

class _SignupButton extends StatelessWidget {
  const _SignupButton({required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: constraints.maxWidth,
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Colors.red),
            onPressed: !state.isValid
                ? null
                : () => context.read<SignupCubit>().onSignupPressed(),
            child: state.status.isInProgress
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CupertinoActivityIndicator(
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Signup',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  )
                : Text(
                    'Signup',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
          );
        },
      ),
    );
  }
}
