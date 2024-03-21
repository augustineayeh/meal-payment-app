part of '../../pages/login_screen.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          width: constraints.maxWidth,
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:     Colors.red,
                ),
                onPressed: !state.isValid
                    ? null
                    : () => context.read<LoginCubit>().onLoginPressed(),
                child: state.status.isInProgress
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CupertinoActivityIndicator(
                              color: Colors.red,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                       color: Colors.red,
                                    ),
                          ),
                        ],
                      )
                    : Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.red,
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
