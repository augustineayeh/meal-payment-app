import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menus_state.dart';

class MenusCubit extends Cubit<MenusState> {
  MenusCubit() : super(MenusInitial());
}
