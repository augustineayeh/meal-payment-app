// part of '../../pages/signup_screen.dart';

// class _SignupWithGoogleButton extends StatelessWidget {
//   const _SignupWithGoogleButton({required this.constraints});
//   final BoxConstraints constraints;

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SignupCubit, SignupState>(
//       listener: (context, state) {},
//       child: BlocBuilder<SignupCubit, SignupState>(
//         builder: (context, state) {
//           return SizedBox(
//             height: 50,
//             width: constraints.maxWidth,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: ColorConsts.grey,
//               ),
//               onPressed: () {
//                 context.read<SignupCubit>().onSignupWithGoogle();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: state.status == FormzSubmissionStatus.inProgress
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const CupertinoActivityIndicator(
//                             color: ColorConsts.grey,
//                           ),
//                           const Gap(5),
//                           Image.asset(
//                             AssetConsts.google,
//                             height: 20,
//                             width: 20,
//                           ),
//                           const Gap(20),
//                           Text(
//                             'Signup with Google',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyLarge
//                                 ?.copyWith(
//                                   color:
//                                       Theme.of(context).colorScheme.onPrimary,
//                                 ),
//                           ),
//                         ],
//                       )
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             AssetConsts.google,
//                             height: 20,
//                             width: 20,
//                           ),
//                           const Gap(20),
//                           Text(
//                             'Signup with Google',
//                             style:
//                                 Theme.of(context).textTheme.bodyLarge?.copyWith(
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onPrimary
//                                           .withOpacity(0.6),
//                                     ),
//                           ),
//                         ],
//                       ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
