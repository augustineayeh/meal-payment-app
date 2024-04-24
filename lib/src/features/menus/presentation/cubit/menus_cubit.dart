import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

import '../../data/models/menu_model.dart';
import '../../domain/entities/menu.dart';
import '../../domain/repositories/menu_repository.dart';

part 'menus_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit({
    required MenuRepository menuRepository,
  })  : _menuRepository = menuRepository,
        super(
          const MenuState(),
        );

  final MenuRepository _menuRepository;

  void onNameChanged(String nameInput) {
    final name = Field.dirty(nameInput);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate(
          [
            name,
            state.image,
            state.price,
            state.days,
            state.details,
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
            image,
            state.price,
            state.days,
            state.details,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onDetailsChanged(detailsInput) {
    final details = ListField.dirty(detailsInput);
    emit(
      state.copyWith(
        details: details,
        isValid: Formz.validate(
          [
            state.name,
            state.image,
            state.price,
            state.days,
            details,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onDaysChanged(String daysInput) {
    final days = Field.dirty(daysInput);
    emit(
      state.copyWith(
        days: days,
        isValid: Formz.validate(
          [
            state.name,
            state.image,
            state.price,
            days,
            state.details,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onPriceChanged(priceInput) {
    final price = Decimal.dirty(priceInput);
    emit(
      state.copyWith(
        price: price,
        isValid: Formz.validate(
          [
            state.name,
            state.image,
            price,
            state.days,
            state.details,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void createMenu() async {
    emit(
      state.copyWith(
        formStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    final menu = MenuModel(
      id: '',
      name: state.name.value,
      details: state.details.value,
      price: double.parse(state.price.value),
      vendorId: '609835d4-f876-4ea5-8720-7d9840c4657b',
      days: state.days.value,
    );

    final failureOrSuccess = await _menuRepository.createMenu(menu: menu);
    failureOrSuccess.fold(
      (failure) {
        // print('ERROR ${failure.errorMessage}');
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

  void fetchMenusList() async {
    emit(
      state.copyWith(
        status: MenuStatus.loading,
      ),
    );

    final failureOrMenusList = await _menuRepository.fetchMenus();

    failureOrMenusList.fold(
      (failure) {
        emit(
          state.copyWith(
            status: MenuStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (menusList) {
        emit(
          state.copyWith(
            status: MenuStatus.success,
            menus: menusList,
          ),
        );
      },
    );
  }

  void fetchSingleMenu(String menuId) async {
    emit(
      state.copyWith(
        status: MenuStatus.loading,
      ),
    );

    final failureOrMenu = await _menuRepository.fetchSingleMenu(menuId);

    failureOrMenu.fold(
      (failure) {
        emit(
          state.copyWith(
            status: MenuStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (menu) {
        emit(
          state.copyWith(
            status: MenuStatus.success,
            menu: menu,
          ),
        );
      },
    );
  }
}
