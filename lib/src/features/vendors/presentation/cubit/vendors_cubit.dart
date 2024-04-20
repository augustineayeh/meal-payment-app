import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz_input/formz_input.dart';
import '../../domain/repositories/vendor_repository.dart';

import '../../domain/entities/vendor.dart';

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
