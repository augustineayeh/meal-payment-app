// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'menus_cubit.dart';

enum MenuStatus { initial, loading, success, failure }

class MenuState extends Equatable {
  const MenuState({
    this.name = const Field.pure(),
    this.image = const Field.pure(),
    this.vendor = const Field.pure(),
    this.details = const ListField.pure(),
    this.price = const Decimal.pure(),
    this.days = const Field.pure(),
    this.status = MenuStatus.initial,
    this.menu = Menu.empty,
    this.menus = const <Menu>[],
    this.formStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });
  final Field name;
  final Field image;
  final Field vendor;
  final ListField details;
  final Decimal price;
  final Field days;

  final MenuStatus status;
  final Menu menu;
  final List<Menu> menus;
  final String? errorMessage;
  final FormzSubmissionStatus formStatus;
  final bool isValid;

  MenuState copyWith({
    Field? name,
    Field? image,
    Field? vendor,
    ListField? details,
    Decimal? price,
    Field? days,
    MenuStatus? status,
    Menu? menu,
    List<Menu>? menus,
    String? errorMessage,
    FormzSubmissionStatus? formStatus,
    bool? isValid,
  }) {
    return MenuState(
      name: name ?? this.name,
      image: image ?? this.image,
      vendor: vendor ?? this.vendor,
      details: details ?? this.details,
      price: price ?? this.price,
      days: days ?? this.days,
      status: status ?? this.status,
      menu: menu ?? this.menu,
      menus: menus ?? this.menus,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      image,
      vendor,
      details,
      price,
      days,
      status,
      menu,
      menus,
      errorMessage,
      formStatus,
      isValid,
    ];
  }
}
