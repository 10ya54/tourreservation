import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tourreservation/ui/common/validators/widget_manager.dart';

/// 入力テキストフィールド
class InputTextFormField extends StatelessWidget {
  final String keyText;
  final String labelText;
  final WidgetManager widgetManager;
  final bool isRequired;
  final bool isObscure;
  final TextInputType keyboardType;
  final List<String? Function(String?)> validators;

  const InputTextFormField({
    super.key,
    required this.keyText,
    required this.labelText,
    required this.widgetManager,
    this.isRequired = false,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.validators = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            if (isRequired)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Text(
                  '必須',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        TextFormField(
          key: widgetManager.createFormKey(keyText),
          controller: widgetManager.createController(keyText),
          focusNode: widgetManager.createFocusNode(keyText),
          obscureText: isObscure,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorStyle: const TextStyle(fontSize: 12),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            labelText: labelText,
          ),
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!isRequired && (value == null || value.isEmpty)) {
              return null;
            }
            return FormBuilderValidators.compose(validators)(value);
          },
        ),
      ],
    );
  }
}
