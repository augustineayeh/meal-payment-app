import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/blocs/theme_cubit/theme_cubit.dart';
import '../../domain/repository/repository.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import 'pages.dart';

part '../widgets/signup_widgets/confirm_password_text_field.dart';
part '../widgets/signup_widgets/email_text_field.dart';
part '../widgets/signup_widgets/first_name_text_field.dart';
part '../widgets/signup_widgets/last_name_text_field.dart';
part '../widgets/signup_widgets/password_text_field.dart';
part '../widgets/signup_widgets/signup_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: BlocProvider(
            create: (context) => SignupCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
            child: BlocListener<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state.status == FormzSubmissionStatus.success) {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                } else if (state.status == FormzSubmissionStatus.failure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          '${state.errorMessage}',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ),
                    );
                }
              },
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: constraints.maxHeight * 0.01,
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocBuilder<ThemeCubit, ThemeState>(
                            builder: (context, state) {
                              return Image.asset('',
                                  // AssetConsts.logo,
                                  height: 90,
                                  width: 90,
                                  color: Colors.red);
                            },
                          ),
                          const Gap(20),
                          Text(
                            'Create Account',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Gap(30),
                          const _FirstNameTextField(),
                          const Gap(10),
                          const _LastNameTextField(),
                          const Gap(10),
                          const _EmailTextField(),
                          const Gap(10),
                          const _PasswordTextField(),
                          const Gap(10),
                          const _ConfirmPasswordTextField(),
                          const Gap(30),
                          _SignupButton(constraints: constraints),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                              TextButton(
                                child: Text(
                                  'Log in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.red,
                                      ),
                                ),
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'Or',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  height: 1,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const Gap(15),
                          // _SignupWithGoogleButton(
                          //   constraints: constraints,
                          // ),
                          // const Gap(10),
                          // _SignupWithFacebookButton(
                          //   constraints: constraints,
                          // ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
