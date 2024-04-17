part of '../../pages/signup_screen.dart';

class _ConfirmPasswordTextField extends StatefulWidget {
  const _ConfirmPasswordTextField();

  @override
  State<_ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<_ConfirmPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    bool showPassword = false;
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return TextField(
          obscureText: showPassword ? false : true,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: state.themeMode == AppThemeMode.darkMode
                        ? Colors.red
                        : Colors.black,
                  );
                },
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            hintText: 'Confirm Password',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
            errorText: state.confirmPassword.displayError != null
                ? 'passwords do not match'
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onChanged: (String passwordString) => context
              .read<SignupCubit>()
              .onConfirmPasswordChanged(passwordString),
        );
      },
    );
  }
}
