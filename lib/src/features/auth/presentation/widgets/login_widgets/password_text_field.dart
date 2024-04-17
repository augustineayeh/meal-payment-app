part of '../../pages/login_screen.dart';

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField();

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
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
                        ?Colors.red
                        : Colors.blue,
                  );
                },
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            hintText: 'Password',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
            errorText:
                state.password.displayError != null ? 'invalid password' : null,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                   color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onChanged: (String passwordString) =>
              context.read<LoginCubit>().onPasswordChanged(passwordString),
        );
      },
    );
  }
}
