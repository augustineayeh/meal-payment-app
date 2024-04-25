part of '../pages/add_school_page.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolCubit, SchoolState>(
      // buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          // keyboardType: TextInputType.emailAddress,
          // style: Theme.of(context).textTheme.titleMedium?.copyWith(
          //       color: Theme.of(context).colorScheme.onPrimary,
          //     ),
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
                state.email.displayError != null ? 'Invalid email' : null,
            focusedBorder: OutlineInputBorder(
              // borderSide: const Borde
              //   color: ColorConsts.primaryColor,
              // ),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              // borderSide: BorderSide(
              //   color: ColorConsts.grey.withOpacity(0.5),
              // ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onChanged: (String value) =>
              context.read<SchoolCubit>().onEmailChanged(value),
        );
      },
    );
  }
}
