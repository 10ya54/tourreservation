import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tourreservation/ui/common/ui/date_picker_field.dart';
import 'package:tourreservation/ui/common/ui/input_text_form_field.dart';

import '../view_model/registration_viewmodel.dart';

enum NewCustomerRegistrationField {
  customerId,
  firstName,
  lastName,
  firstNameReading,
  lastNameReading,
  birthday,
  email,
  tel,
  zip,
  address,
  password,
  confirmPassword,
}

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final Logger logger = Logger();
  final _registrationFormKey = GlobalKey<FormState>();
  final _focusNodes = {
    NewCustomerRegistrationField.customerId: FocusNode(),
    NewCustomerRegistrationField.lastName: FocusNode(),
    NewCustomerRegistrationField.firstName: FocusNode(),
    NewCustomerRegistrationField.lastNameReading: FocusNode(),
    NewCustomerRegistrationField.firstNameReading: FocusNode(),
    NewCustomerRegistrationField.email: FocusNode(),
    NewCustomerRegistrationField.tel: FocusNode(),
    NewCustomerRegistrationField.zip: FocusNode(),
    NewCustomerRegistrationField.address: FocusNode(),
    NewCustomerRegistrationField.password: FocusNode(),
    NewCustomerRegistrationField.confirmPassword: FocusNode(),
  };

  @override
  void dispose() {
    for (final node in _focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(registrationViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _registrationFormKey,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '以下の項目に必要事項をご記入後、「確認」ボタンをクリックしてください。',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        CustomerIdField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .customerId]!,
                        ),
                        const SizedBox(height: 16),
                        NameFields(
                          lastNameFocusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .lastName]!,
                          firstNameFocusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .firstName]!,
                        ),
                        const SizedBox(height: 16),
                        KanaFields(
                          lastNameReadingFocusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .lastNameReading]!,
                          firstNameReadingFocusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .firstNameReading]!,
                        ),
                        const SizedBox(height: 16),
                        BirthdayField(),
                        const SizedBox(height: 16),
                        EmailField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField.email]!,
                        ),
                        const SizedBox(height: 16),
                        TelField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField.tel]!,
                        ),
                        const SizedBox(height: 16),
                        ZipField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField.zip]!,
                        ),
                        const SizedBox(height: 16),
                        AddressField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .address]!,
                        ),
                        const SizedBox(height: 16),
                        PasswordField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .password]!,
                        ),
                        const SizedBox(height: 16),
                        ConfirmPasswordField(
                          focusNode:
                              _focusNodes[NewCustomerRegistrationField
                                  .confirmPassword]!,
                        ),
                        const SizedBox(height: 32),
                        FilledButton(
                          onPressed: () {
                            if (!_registrationFormKey.currentState!
                                .validate()) {
                              // 入力値にエラーがある場合は処理を中断
                              _showErrorDialog(context, '入力内容にエラーがあります。');
                              return;
                            }
                            notifier.submit();
                          },
                          child: const Text('確認'),
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

/// 顧客IDフィールド
class CustomerIdField extends ConsumerWidget {
  final FocusNode focusNode;
  const CustomerIdField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.customerId),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: '顧客ID',
      focusNode: focusNode,
      isRequired: true,
      isObscure: false,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateCustomerId,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(3),
        FormBuilderValidators.maxLength(20),
      ],
    );
  }
}

/// 名前フィールド（姓・名）
class NameFields extends StatelessWidget {
  final FocusNode lastNameFocusNode;
  final FocusNode firstNameFocusNode;

  const NameFields({
    super.key,
    required this.lastNameFocusNode,
    required this.firstNameFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: LastNameField(focusNode: lastNameFocusNode)),
        const SizedBox(width: 16),
        Expanded(child: FirstNameField(focusNode: firstNameFocusNode)),
      ],
    );
  }
}

/// 名前フィールド（姓）
class LastNameField extends ConsumerWidget {
  final FocusNode focusNode;
  const LastNameField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.lastName),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: '姓',
      focusNode: focusNode,
      isRequired: true,
      isObscure: false,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateLastName,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(10),
      ],
    );
  }
}

/// 名前フィールド（名）
class FirstNameField extends ConsumerWidget {
  final FocusNode focusNode;
  const FirstNameField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.firstName),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: '名',
      focusNode: focusNode,
      isRequired: true,
      isObscure: false,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateFirstName,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(10),
      ],
    );
  }
}

/// 名前フィールド（姓・名）
class KanaFields extends StatelessWidget {
  final FocusNode lastNameReadingFocusNode;
  final FocusNode firstNameReadingFocusNode;

  const KanaFields({
    super.key,
    required this.lastNameReadingFocusNode,
    required this.firstNameReadingFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LastNameReadingField(focusNode: lastNameReadingFocusNode),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FirstNameReadingField(focusNode: firstNameReadingFocusNode),
        ),
      ],
    );
  }
}

/// 名前フィールド（姓）
class LastNameReadingField extends ConsumerWidget {
  final FocusNode focusNode;
  const LastNameReadingField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.lastNameReading),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: 'セイ',
      focusNode: focusNode,
      isRequired: true,
      isObscure: false,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateLastNameReading,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(10),
        FormBuilderValidators.match(
          RegExp(r'^[ァ-ンヴー]+$'),
          errorText: 'カタカナで入力してください',
        ),
      ],
    );
  }
}

/// 名前フィールド（名）
class FirstNameReadingField extends ConsumerWidget {
  final FocusNode focusNode;
  const FirstNameReadingField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.firstNameReading),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: 'メイ',
      focusNode: focusNode,
      isRequired: true,
      isObscure: false,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateFirstNameReading,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(10),
        FormBuilderValidators.match(
          RegExp(r'^[ァ-ンヴー]+$'),
          errorText: 'カタカナで入力してください',
        ),
      ],
    );
  }
}

/// 生年月日フィールド
class BirthdayField extends ConsumerWidget {
  const BirthdayField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final birthday = ref.watch(
      registrationViewModelProvider.select((s) => s.birthday),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return DatePickerField(
      labelText: '生年月日',
      minDate: DateTime(1910, 1, 1),
      maxDate: DateTime.now(),
      selectedDate: birthday,
      onDateSelected: (date) => notifier.updateBirthday(date!),
      isRequired: true,
    );
  }
}

/// メールアドレスフィールド
class EmailField extends ConsumerWidget {
  final FocusNode focusNode;
  const EmailField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.email),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: 'メールアドレス',
      focusNode: focusNode,
      isRequired: true,
      isObscure: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: notifier.updateEmail,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
        FormBuilderValidators.maxLength(50),
      ],
    );
  }
}

/// 電話番号フィールド
class TelField extends ConsumerWidget {
  final FocusNode focusNode;
  const TelField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(registrationViewModelProvider.select((s) => s.tel));

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value ?? '',
      labelText: '電話番号',
      focusNode: focusNode,
      isRequired: false,
      isObscure: false,
      keyboardType: TextInputType.phone,
      onChanged: notifier.updateTel,
      validators: [
        FormBuilderValidators.maxLength(15),
        FormBuilderValidators.match(
          RegExp(r'^\d{10,15}$'),
          errorText: '電話番号は10～15桁の数字で入力してください',
        ),
      ],
    );
  }
}

/// 郵便番号フィールド
class ZipField extends ConsumerWidget {
  final FocusNode focusNode;
  const ZipField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(registrationViewModelProvider.select((s) => s.zip));

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value ?? '',
      labelText: '郵便番号',
      focusNode: focusNode,
      isRequired: false,
      isObscure: false,
      keyboardType: TextInputType.number,
      onChanged: notifier.updateZip,
      validators: [
        FormBuilderValidators.maxLength(8),
        FormBuilderValidators.match(
          RegExp(r'^\d{3}-?\d{4}$'),
          errorText: '郵便番号は「123-4567」または「1234567」の形式で入力してください',
        ),
      ],
    );
  }
}

/// 住所フィールド
class AddressField extends ConsumerWidget {
  final FocusNode focusNode;
  const AddressField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.address),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value ?? '',
      labelText: '住所',
      focusNode: focusNode,
      isRequired: false,
      isObscure: false,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateAddress,
      validators: [FormBuilderValidators.maxLength(50)],
    );
  }
}

/// パスワードフィールド
class PasswordField extends ConsumerWidget {
  final FocusNode focusNode;
  const PasswordField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.password),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: 'パスワード',
      focusNode: focusNode,
      isRequired: true,
      isObscure: true,
      keyboardType: TextInputType.text,
      onChanged: notifier.updatePassword,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(8),
      ],
    );
  }
}

/// パスワード確認用フィールド
class ConfirmPasswordField extends ConsumerWidget {
  final FocusNode focusNode;
  const ConfirmPasswordField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      registrationViewModelProvider.select((s) => s.confirmPassword),
    );
    final password = ref.watch(
      registrationViewModelProvider.select((s) => s.password),
    );

    final notifier = ref.read(registrationViewModelProvider.notifier);

    return InputTextFormField(
      formText: value,
      labelText: 'パスワード(確認用)',
      focusNode: focusNode,
      isRequired: true,
      isObscure: true,
      keyboardType: TextInputType.text,
      onChanged: notifier.updateConfirmPassword,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(8),
        FormBuilderValidators.equal(password, errorText: 'パスワードが一致しません'),
      ],
    );
  }
}

/// エラーダイアログ
void _showErrorDialog(BuildContext context, String message) {
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
