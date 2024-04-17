import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parents_state.dart';

class ParentsCubit extends Cubit<ParentsState> {
  ParentsCubit() : super(const ParentsState());
}
