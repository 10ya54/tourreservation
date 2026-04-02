import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tourreservation/ui/registration/form/registration_form.dart';

part 'registration_viewmodel.g.dart';

@riverpod
class RegistrationViewModel extends _$RegistrationViewModel {
  final Logger _logger = Logger();
  @override
  RegistrationForm build() {
    return RegistrationForm(
      customerId: '',
      lastName: '',
      firstName: '',
      lastNameReading: '',
      firstNameReading: '',
      birthday: DateTime.now(),
      email: '',
      tel: null,
      zip: null,
      address: null,
      password: '',
      confirmPassword: '',
    );
  }

  void updateCustomerId(String v) => state = state.copyWith(customerId: v);
  void updateLastName(String v) => state = state.copyWith(lastName: v);
  void updateFirstName(String v) => state = state.copyWith(firstName: v);
  void updateLastNameReading(String v) =>
      state = state.copyWith(lastNameReading: v);
  void updateFirstNameReading(String v) =>
      state = state.copyWith(firstNameReading: v);
  void updateBirthday(DateTime birthday) =>
      state = state.copyWith(birthday: birthday);
  void updateEmail(String v) => state = state.copyWith(email: v);
  void updateTel(String? v) => state = state.copyWith(tel: v);
  void updateZip(String? v) => state = state.copyWith(zip: v);
  void updateAddress(String? v) => state = state.copyWith(address: v);
  void updatePassword(String v) => state = state.copyWith(password: v);
  void updateConfirmPassword(String v) =>
      state = state.copyWith(confirmPassword: v);

  void updateAll(RegistrationForm form) {
    state = form;
  }

  void submit() {
    _logger.i('Submitting registration form: ${state.toString()}');
  }
}
