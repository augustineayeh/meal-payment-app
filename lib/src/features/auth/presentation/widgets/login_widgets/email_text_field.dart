part of '../../pages/login_screen.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            hintText: 'Email',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
            errorText:
                state.email.displayError != null ? 'invalid password' : null,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
               color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onChanged: (String emailString) =>
              context.read<LoginCubit>().onEmailChanged(emailString),
        );
      },
    );
  }
}
