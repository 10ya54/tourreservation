import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WidgetManager {
  Map<String, TextEditingController> controllers = {};
  Map<String, FocusNode> focusNodes = {};
  Map<String, GlobalKey<FormFieldState<dynamic>>> formKeys = {};

  TextEditingController createController(String fieldName) {
    return controllers.putIfAbsent(fieldName, () => TextEditingController());
  }

  FocusNode createFocusNode(String fieldName) {
    return focusNodes.putIfAbsent(fieldName, () {
      final focusNode = FocusNode();
      focusNode.addListener(() {
        final formKey = createFormKey(fieldName);
        if (!focusNode.hasFocus) {
          formKey.currentState?.validate();
        }
      });
      return focusNode;
    });
  }

  GlobalKey<FormFieldState> createFormKey(String fieldName) {
    return formKeys.putIfAbsent(fieldName, () => GlobalKey<FormFieldState>());
  }

  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    focusNodes.forEach((_, focusNode) => focusNode.dispose());
  }

  bool get isValid {
    return formKeys.values.every(
      (key) => key.currentState?.validate() ?? false,
    );
  }
}

final widgetManagerProvider = Provider.autoDispose<WidgetManager>((ref) {
  final manager = WidgetManager();
  ref.onDispose(manager.dispose);
  return manager;
});
