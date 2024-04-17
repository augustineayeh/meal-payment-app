import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/flushbar.dart';
import '../../../../core/routes/routes.dart';
import '../../../../common/blocs/theme_cubit/theme_cubit.dart';
import '../../domain/repository/repository.dart';
import '../cubits/login_cubit/login_cubit.dart';

part '../widgets/login_widgets/email_text_field.dart';
part '../widgets/login_widgets/login_button.dart';

part '../widgets/login_widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            create: (context) => LoginCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status == FormzSubmissionStatus.failure) {
                  showFlushSnackbar3(
                    context: context,
                    message: state.errorMessage ?? 'Unknown Error',
                    isResponseSuccessful: false,
                    duration: const Duration(seconds: 3),
                  );
                } else if (state.status == FormzSubmissionStatus.success) {
                  context.pop();
                }
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: constraints.maxHeight * 0.1,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                            return Image.asset(
                              '',
                              // AssetConsts.logo,
                              height: 90,
                              width: 90,
                              color: Colors.red,
                            );
                          },
                        ),
                        const Gap(20),
                        Text(
                          'Welcome',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Gap(40),
                        const _EmailTextField(),
                        const Gap(10),
                        const _PasswordTextField(),
                        const Gap(30),
                        _LoginButton(constraints: constraints),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont\'t have an email?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            TextButton(
                              child: Text(
                                'Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.red,
                                    ),
                              ),
                              onPressed: () =>
                                  context.push(RouteConsts.signupRoute),
                            ),
                          ],
                        ),
                        const Gap(20),
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
                        const Gap(20),
                        // _LoginWithGoogleButton(
                        //   constraints: constraints,
                        // ),
                        const Gap(15),
                        // _LoginWithFacebookButton(
                        //   constraints: constraints,
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
