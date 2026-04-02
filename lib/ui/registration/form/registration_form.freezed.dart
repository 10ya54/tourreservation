// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegistrationForm {

 String get customerId; String get lastName; String get firstName; String get lastNameReading; String get firstNameReading; DateTime get birthday; String get email; String? get tel; String? get zip; String? get address; String get password; String get confirmPassword;
/// Create a copy of RegistrationForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationFormCopyWith<RegistrationForm> get copyWith => _$RegistrationFormCopyWithImpl<RegistrationForm>(this as RegistrationForm, _$identity);

  /// Serializes this RegistrationForm to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationForm&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastNameReading, lastNameReading) || other.lastNameReading == lastNameReading)&&(identical(other.firstNameReading, firstNameReading) || other.firstNameReading == firstNameReading)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.email, email) || other.email == email)&&(identical(other.tel, tel) || other.tel == tel)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.address, address) || other.address == address)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,lastName,firstName,lastNameReading,firstNameReading,birthday,email,tel,zip,address,password,confirmPassword);

@override
String toString() {
  return 'RegistrationForm(customerId: $customerId, lastName: $lastName, firstName: $firstName, lastNameReading: $lastNameReading, firstNameReading: $firstNameReading, birthday: $birthday, email: $email, tel: $tel, zip: $zip, address: $address, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $RegistrationFormCopyWith<$Res>  {
  factory $RegistrationFormCopyWith(RegistrationForm value, $Res Function(RegistrationForm) _then) = _$RegistrationFormCopyWithImpl;
@useResult
$Res call({
 String customerId, String lastName, String firstName, String lastNameReading, String firstNameReading, DateTime birthday, String email, String? tel, String? zip, String? address, String password, String confirmPassword
});




}
/// @nodoc
class _$RegistrationFormCopyWithImpl<$Res>
    implements $RegistrationFormCopyWith<$Res> {
  _$RegistrationFormCopyWithImpl(this._self, this._then);

  final RegistrationForm _self;
  final $Res Function(RegistrationForm) _then;

/// Create a copy of RegistrationForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = null,Object? lastName = null,Object? firstName = null,Object? lastNameReading = null,Object? firstNameReading = null,Object? birthday = null,Object? email = null,Object? tel = freezed,Object? zip = freezed,Object? address = freezed,Object? password = null,Object? confirmPassword = null,}) {
  return _then(_self.copyWith(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastNameReading: null == lastNameReading ? _self.lastNameReading : lastNameReading // ignore: cast_nullable_to_non_nullable
as String,firstNameReading: null == firstNameReading ? _self.firstNameReading : firstNameReading // ignore: cast_nullable_to_non_nullable
as String,birthday: null == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,tel: freezed == tel ? _self.tel : tel // ignore: cast_nullable_to_non_nullable
as String?,zip: freezed == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationForm].
extension RegistrationFormPatterns on RegistrationForm {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationForm() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationForm value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationForm():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationForm value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationForm() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String customerId,  String lastName,  String firstName,  String lastNameReading,  String firstNameReading,  DateTime birthday,  String email,  String? tel,  String? zip,  String? address,  String password,  String confirmPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationForm() when $default != null:
return $default(_that.customerId,_that.lastName,_that.firstName,_that.lastNameReading,_that.firstNameReading,_that.birthday,_that.email,_that.tel,_that.zip,_that.address,_that.password,_that.confirmPassword);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String customerId,  String lastName,  String firstName,  String lastNameReading,  String firstNameReading,  DateTime birthday,  String email,  String? tel,  String? zip,  String? address,  String password,  String confirmPassword)  $default,) {final _that = this;
switch (_that) {
case _RegistrationForm():
return $default(_that.customerId,_that.lastName,_that.firstName,_that.lastNameReading,_that.firstNameReading,_that.birthday,_that.email,_that.tel,_that.zip,_that.address,_that.password,_that.confirmPassword);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String customerId,  String lastName,  String firstName,  String lastNameReading,  String firstNameReading,  DateTime birthday,  String email,  String? tel,  String? zip,  String? address,  String password,  String confirmPassword)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationForm() when $default != null:
return $default(_that.customerId,_that.lastName,_that.firstName,_that.lastNameReading,_that.firstNameReading,_that.birthday,_that.email,_that.tel,_that.zip,_that.address,_that.password,_that.confirmPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistrationForm implements RegistrationForm {
  const _RegistrationForm({required this.customerId, required this.lastName, required this.firstName, required this.lastNameReading, required this.firstNameReading, required this.birthday, required this.email, this.tel, this.zip, this.address, required this.password, required this.confirmPassword});
  factory _RegistrationForm.fromJson(Map<String, dynamic> json) => _$RegistrationFormFromJson(json);

@override final  String customerId;
@override final  String lastName;
@override final  String firstName;
@override final  String lastNameReading;
@override final  String firstNameReading;
@override final  DateTime birthday;
@override final  String email;
@override final  String? tel;
@override final  String? zip;
@override final  String? address;
@override final  String password;
@override final  String confirmPassword;

/// Create a copy of RegistrationForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationFormCopyWith<_RegistrationForm> get copyWith => __$RegistrationFormCopyWithImpl<_RegistrationForm>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistrationFormToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationForm&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastNameReading, lastNameReading) || other.lastNameReading == lastNameReading)&&(identical(other.firstNameReading, firstNameReading) || other.firstNameReading == firstNameReading)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.email, email) || other.email == email)&&(identical(other.tel, tel) || other.tel == tel)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.address, address) || other.address == address)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,lastName,firstName,lastNameReading,firstNameReading,birthday,email,tel,zip,address,password,confirmPassword);

@override
String toString() {
  return 'RegistrationForm(customerId: $customerId, lastName: $lastName, firstName: $firstName, lastNameReading: $lastNameReading, firstNameReading: $firstNameReading, birthday: $birthday, email: $email, tel: $tel, zip: $zip, address: $address, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class _$RegistrationFormCopyWith<$Res> implements $RegistrationFormCopyWith<$Res> {
  factory _$RegistrationFormCopyWith(_RegistrationForm value, $Res Function(_RegistrationForm) _then) = __$RegistrationFormCopyWithImpl;
@override @useResult
$Res call({
 String customerId, String lastName, String firstName, String lastNameReading, String firstNameReading, DateTime birthday, String email, String? tel, String? zip, String? address, String password, String confirmPassword
});




}
/// @nodoc
class __$RegistrationFormCopyWithImpl<$Res>
    implements _$RegistrationFormCopyWith<$Res> {
  __$RegistrationFormCopyWithImpl(this._self, this._then);

  final _RegistrationForm _self;
  final $Res Function(_RegistrationForm) _then;

/// Create a copy of RegistrationForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = null,Object? lastName = null,Object? firstName = null,Object? lastNameReading = null,Object? firstNameReading = null,Object? birthday = null,Object? email = null,Object? tel = freezed,Object? zip = freezed,Object? address = freezed,Object? password = null,Object? confirmPassword = null,}) {
  return _then(_RegistrationForm(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastNameReading: null == lastNameReading ? _self.lastNameReading : lastNameReading // ignore: cast_nullable_to_non_nullable
as String,firstNameReading: null == firstNameReading ? _self.firstNameReading : firstNameReading // ignore: cast_nullable_to_non_nullable
as String,birthday: null == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,tel: freezed == tel ? _self.tel : tel // ignore: cast_nullable_to_non_nullable
as String?,zip: freezed == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
