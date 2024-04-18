import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vendors_state.dart';

class VendorsCubit extends Cubit<VendorsState> {
  VendorsCubit() : super(VendorsInitial());
}
