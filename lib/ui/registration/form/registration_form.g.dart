// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistrationForm _$RegistrationFormFromJson(Map<String, dynamic> json) =>
    _RegistrationForm(
      customerId: json['customerId'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      lastNameReading: json['lastNameReading'] as String,
      firstNameReading: json['firstNameReading'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      email: json['email'] as String,
      tel: json['tel'] as String?,
      zip: json['zip'] as String?,
      address: json['address'] as String?,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$RegistrationFormToJson(_RegistrationForm instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'lastNameReading': instance.lastNameReading,
      'firstNameReading': instance.firstNameReading,
      'birthday': instance.birthday.toIso8601String(),
      'email': instance.email,
      'tel': instance.tel,
      'zip': instance.zip,
      'address': instance.address,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
