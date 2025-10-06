// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginForm {

 String get userId; String get password;
/// Create a copy of LoginForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFormCopyWith<LoginForm> get copyWith => _$LoginFormCopyWithImpl<LoginForm>(this as LoginForm, _$identity);

  /// Serializes this LoginForm to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginForm&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,password);

@override
String toString() {
  return 'LoginForm(userId: $userId, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginFormCopyWith<$Res>  {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) _then) = _$LoginFormCopyWithImpl;
@useResult
$Res call({
 String userId, String password
});




}
/// @nodoc
class _$LoginFormCopyWithImpl<$Res>
    implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._self, this._then);

  final LoginForm _self;
  final $Res Function(LoginForm) _then;

/// Create a copy of LoginForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? password = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginForm].
extension LoginFormPatterns on LoginForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginForm value)  $default,){
final _that = this;
switch (_that) {
case _LoginForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginForm value)?  $default,){
final _that = this;
switch (_that) {
case _LoginForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginForm() when $default != null:
return $default(_that.userId,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginForm():
return $default(_that.userId,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginForm() when $default != null:
return $default(_that.userId,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginForm implements LoginForm {
  const _LoginForm({required this.userId, required this.password});
  factory _LoginForm.fromJson(Map<String, dynamic> json) => _$LoginFormFromJson(json);

@override final  String userId;
@override final  String password;

/// Create a copy of LoginForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormCopyWith<_LoginForm> get copyWith => __$LoginFormCopyWithImpl<_LoginForm>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginFormToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginForm&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,password);

@override
String toString() {
  return 'LoginForm(userId: $userId, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginFormCopyWith<$Res> implements $LoginFormCopyWith<$Res> {
  factory _$LoginFormCopyWith(_LoginForm value, $Res Function(_LoginForm) _then) = __$LoginFormCopyWithImpl;
@override @useResult
$Res call({
 String userId, String password
});




}
/// @nodoc
class __$LoginFormCopyWithImpl<$Res>
    implements _$LoginFormCopyWith<$Res> {
  __$LoginFormCopyWithImpl(this._self, this._then);

  final _LoginForm _self;
  final $Res Function(_LoginForm) _then;

/// Create a copy of LoginForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? password = null,}) {
  return _then(_LoginForm(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
