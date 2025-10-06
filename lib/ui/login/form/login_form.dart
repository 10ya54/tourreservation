import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form.freezed.dart';
part 'login_form.g.dart';

@freezed
abstract class LoginForm with _$LoginForm {
  const factory LoginForm({required String userId, required String password}) =
      _LoginForm;

  factory LoginForm.fromJson(Map<String, Object?> json) =>
      _$LoginFormFromJson(json);
}
