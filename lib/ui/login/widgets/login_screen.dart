import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourreservation/ui/common/ui/input_text_form_field.dart';
import 'package:tourreservation/ui/common/validators/widget_manager.dart';
import 'package:tourreservation/ui/login/form/login_form.dart';
import 'package:tourreservation/ui/login/view_model/login_viewmodel.dart';

import '../../../routing/routes.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final loginStateNotifier = ref.read(loginViewModelProvider.notifier);
    final widgetManager = ref.watch(widgetManagerProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          children: [
            const Icon(Icons.business_center, size: 32),
            const SizedBox(width: 8),
            Text(
              'ツアー予約アプリ',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InputTextFormField(
                                  keyText: 'userId',
                                  labelText: 'ユーザID',
                                  widgetManager: widgetManager,
                                  isRequired: true,
                                  isObscure: false,
                                  keyboardType: TextInputType.text,
                                  validators: [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.match(
                                      RegExp(r'^[a-zA-Z0-9]+$'),
                                      errorText: '半角英数字で入力してください',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                InputTextFormField(
                                  keyText: 'password',
                                  labelText: 'パスワード',
                                  widgetManager: widgetManager,
                                  isRequired: true,
                                  isObscure: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  validators: [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(
                                      6,
                                      errorText: '6文字以上で入力してください',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                try {
                                  await loginStateNotifier.login(
                                    LoginForm(
                                      userId: widgetManager
                                          .createController('userId')
                                          .text,
                                      password: widgetManager
                                          .createController('password')
                                          .text,
                                    ),
                                  );
                                  if (!context.mounted) return;
                                  context.go(Routes.home);
                                } catch (e) {
                                  _showDialog(
                                    context,
                                    'ログインに失敗しました。再度お試しください。',
                                  );
                                }
                              },
                              child: const Text('ログイン'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                try {
                                  final canCheckBiometrics =
                                      await loginStateNotifier
                                          .canCheckBiometrics();
                                  if (canCheckBiometrics) {
                                    final isAuthenticated =
                                        await loginStateNotifier
                                            .biometricLogin();
                                    if (isAuthenticated) {
                                      if (!context.mounted) return;
                                      context.go(Routes.home);
                                    } else {
                                      // _showDialog(context, '生体認証に失敗しました。再度お試しください。');
                                    }
                                  } else {
                                    _showDialog(
                                      context,
                                      '生体認証が利用できません。設定画面をご確認ください。',
                                    );
                                  }
                                } catch (e) {
                                  _showDialog(
                                    context,
                                    'ログインに失敗しました。再度お試しください。',
                                  );
                                }
                              },
                              child: Text('生体認証ログイン'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () => context.push(Routes.login),
                            child: Text('新規登録はこちら'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '*テストユーザとして以下が利用できます。',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'テストユーザ',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 5),
                        Table(
                          border: TableBorder.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'ユーザ種別',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'ユーザID',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'パスワード',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'ユーザ名',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    '顧客',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'c001',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    '山田太郎',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              // decoration: BoxDecoration(color: Colors.grey[300]),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    '顧客',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'c001',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    'password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                    left: 4,
                                  ),
                                  child: Text(
                                    '山田太郎',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// エラーダイアログ
void _showDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('エラー'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
