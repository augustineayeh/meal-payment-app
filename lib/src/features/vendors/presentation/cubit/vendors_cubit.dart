import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

import '../../../schools/domain/entities/school.dart';
import '../../data/models/vendor_model.dart';
import '../../domain/entities/vendor.dart';
import '../../domain/repositories/vendor_repository.dart';

part 'vendors_state.dart';

class VendorCubit extends Cubit<VendorState> {
  VendorCubit({
    required VendorRepository vendorRepository,
  })  : _vendorRepository = vendorRepository,
        super(
          const VendorState(),
        );

  final VendorRepository _vendorRepository;

  void fetchVendorsList() async {
    emit(
      state.copyWith(
        status: VendorStatus.loading,
      ),
    );

    final failureOrVendorsList = await _vendorRepository.fetchVendors();

    failureOrVendorsList.fold(
      (failure) {
        emit(
          state.copyWith(
            status: VendorStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (vendorsList) {
        emit(
          state.copyWith(
            status: VendorStatus.success,
            vendors: vendorsList,
          ),
        );
      },
    );
  }

  void onNameChanged(String nameInput) {
    final name = Field.dirty(nameInput);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate(
          [
            name,
            state.location,
            state.phoneNumber,
            //  state.image,
            // state.school,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onImageChanged(String imageInput) {
    final image = Field.dirty(imageInput);
    emit(
      state.copyWith(
        image: image,
        isValid: Formz.validate(
          [
            state.name,
            state.location,
            state.phoneNumber,
            //  image,
            // state.school,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onLocationChanged(String locationInput) {
    final location = Field.dirty(locationInput);
    emit(
      state.copyWith(
        location: location,
        isValid: Formz.validate(
          [
            state.name,
            location,
            state.phoneNumber,
            //  state.image,
            // state.school,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  // void onSchoolChanged(String schoolInput) {
  //   final school = Field.dirty(schoolInput);
  //   emit(
  //     state.copyWith(
  //       school: school.value,
  //       isValid: Formz.validate(
  //         [
  //           school,
  //           state.name,
  //           state.location,
  //           state.phoneNumber,
  //           // state.image,
  //           // state.school,
  //         ],
  //       ),
  //       formStatus: FormzSubmissionStatus.initial,
  //     ),
  //   );
  // }

  void onPhoneNumberChanged(String phoneNumberInput) {
    final phoneNumber = Field.dirty(phoneNumberInput);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        isValid: Formz.validate(
          [
            state.name,
            state.location,
            phoneNumber,
            // state.image,
            // state.school,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void createVendor(School school) async {
    final vendor = VendorModel(
      name: state.name.value,
      location: state.location.value,
      phoneNumber: state.phoneNumber.value,
      // school: school.id!,
      school: const ['1f0255b9-d768-4e62-8121-900babfdf667'],
      image:
          'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg',
    );

    final failureOrSuccess =
        await _vendorRepository.createVendor(vendor: vendor);
    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            formStatus: FormzSubmissionStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (success) => emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
        ),
      ),
    );
  }

  void fetchSingleVendor(String vendorId) async {
    emit(
      state.copyWith(
        status: VendorStatus.loading,
      ),
    );

    final failureOrVendor = await _vendorRepository.fetchSingleVendor(vendorId);

    failureOrVendor.fold(
      (failure) {
        emit(
          state.copyWith(
            status: VendorStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (vendor) {
        emit(
          state.copyWith(
            status: VendorStatus.success,
            vendor: vendor,
          ),
        );
      },
    );
  }
}
