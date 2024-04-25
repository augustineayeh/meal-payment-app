part of '../pages/add_vendor_page.dart';

class _PhoneNumberTextField extends StatelessWidget {
  const _PhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
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
            hintText: 'Phone',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ),
            errorText: state.phoneNumber.displayError != null
                ? 'invalid number'
                : null,
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
              context.read<VendorCubit>().onPhoneNumberChanged(value),
        );
      },
    );
  }
}
