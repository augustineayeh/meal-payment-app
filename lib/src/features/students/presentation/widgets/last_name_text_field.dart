part of '../pages/add_student_page.dart';

class _LastNameTextField extends StatelessWidget {
  const _LastNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
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
            hintText: 'Last name',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
            errorText: state.lastName.displayError != null ? 'Invalid name' : null,
            focusedBorder: OutlineInputBorder(
              // borderSide: const BorderSide(
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
              context.read<StudentCubit>().onLastNameChanged(value),
        );
      },
    );
  }
}
