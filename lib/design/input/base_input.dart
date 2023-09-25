import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final String _labelText;
  final ValueChanged<String>? _onChanged;
  final TextInputType? _keyboardType;
  final String? _error;

  const BaseInput({
    super.key,
    required labelText,
    required onChanged,
    keyboardType,
    focusable,
    error,
    onTap,
    initialValue,
  })  : _labelText = labelText,
        _onChanged = onChanged,
        _keyboardType = keyboardType,
        _error = error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: _labelText,
          errorText: _error),
      onChanged: _onChanged,
      keyboardType: _keyboardType,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
