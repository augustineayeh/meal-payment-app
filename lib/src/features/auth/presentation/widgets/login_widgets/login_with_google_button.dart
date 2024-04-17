// part of '../../pages/login_screen.dart';

// class _LoginWithGoogleButton extends StatelessWidget {
//   const _LoginWithGoogleButton({required this.constraints});
//   final BoxConstraints constraints;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: constraints.maxWidth,
//       child: BlocBuilder<LoginCubit, LoginState>(
//         builder: (context, state) {
//           return ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               elevation: 0,
//               backgroundColor: Colors.red,
//             ),
//             onPressed: () =>
//                 context.read<LoginCubit>().onLoginWithGoogleButtonPressed(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: state.status == FormzSubmissionStatus.inProgress
//                   ? const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CupertinoActivityIndicator(
//                           color: Colors.red,
//                         ),
//                       ],
//                     )
//                   : Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           '',
//                           height: 20,
//                           width: 20,
//                         ),
//                         const Gap(20),
//                         Text(
//                           'Login with Google',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge
//                               ?.copyWith(
//                                 color: Theme.of(context).colorScheme.onPrimary,
//                               ),
//                         ),
//                       ],
//                     ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
