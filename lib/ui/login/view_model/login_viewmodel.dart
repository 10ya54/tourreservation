import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tourreservation/ui/login/form/login_form.dart';

part 'login_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  final _localAuth = LocalAuthentication();
  final _logger = Logger();
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<LoginForm> build() async {
    // 仮の認証データを登録
    await _secureStorage.write(key: 'userId', value: 'c001');
    await _secureStorage.write(key: 'password', value: 'password');
    return LoginForm(userId: '', password: '');
  }

  /// ログインボタン押下時の処理
  Future<bool> login(LoginForm form) async {
    final userId = await _secureStorage.read(key: 'userId');
    final password = await _secureStorage.read(key: 'password');
    if (form.userId == userId &&
        form.password == password &&
        form.userId.isNotEmpty &&
        form.password.isNotEmpty) {
      state = AsyncValue.data(form);
      return true;
    } else {
      throw Exception('ログインに失敗しました');
    }
  }

  /// 生体認証が可能かどうか確認
  Future<bool> canCheckBiometrics() async {
    bool canAuthenticateWithBiometrics = false;
    bool canAuthenticate = false;
    bool isBiometricAvailable = false;
    try {
      canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      canAuthenticate =
          canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
      final List<BiometricType> availableBiometrics = await _localAuth
          .getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.face) ||
          availableBiometrics.contains(BiometricType.fingerprint) ||
          availableBiometrics.contains(BiometricType.strong)) {
        isBiometricAvailable = true;
      }
    } catch (e) {
      _logger.e('生体認証の利用可否の確認に失敗: $e');
    }
    return canAuthenticate && isBiometricAvailable;
  }

  /// 生体認証の実行
  Future<bool> biometricAuthenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason: '本人確認のために、生体認証を行ってください',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: '本人確認',
            biometricHint: '',
            cancelButton: 'キャンセル',
          ),
          IOSAuthMessages(cancelButton: 'キャンセル'),
        ],
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (e) {
      _logger.e('生体認証の実行に失敗: $e');
      isAuthenticated = false;
    }
    return isAuthenticated;
  }

  /// 生体認証で認証情報を取得してログイン
  Future<bool> biometricLogin() async {
    try {
      final isAuthenticated = await biometricAuthenticateUser();
      if (isAuthenticated) {
        final userId = await _secureStorage.read(key: 'userId') ?? '';
        final password = await _secureStorage.read(key: 'password') ?? '';
        _logger.d('生体認証成功: userId=$userId, password=$password');
        if (userId.isNotEmpty && password.isNotEmpty) {
          return await login(LoginForm(userId: userId, password: password));
        } else {
          _logger.e('保存された認証情報がありません');
          return false;
        }
      }
    } catch (e) {
      _logger.e('生体認証によるログインに失敗: $e');
    }
    return false;
  }
}
