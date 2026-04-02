import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_form.freezed.dart';
part 'registration_form.g.dart';

@freezed
abstract class RegistrationForm with _$RegistrationForm {
  const factory RegistrationForm({
    required String customerId,
    required String lastName,
    required String firstName,
    required String lastNameReading,
    required String firstNameReading,
    required DateTime birthday,
    required String email,
    String? tel,
    String? zip,
    String? address,
    required String password,
    required String confirmPassword,
  }) = _RegistrationForm;

  factory RegistrationForm.fromJson(Map<String, Object?> json) =>
      _$RegistrationFormFromJson(json);
}
