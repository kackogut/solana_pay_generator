import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final String _labelText;
  final ValueChanged<String>? _onChanged;
  final TextInputType? _keyboardType;
  final bool _focusable;
  final String? _error;
  final GestureTapCallback? _onTap;
  final String? _initialValue;

  const BaseInput(
      {super.key,
      required labelText,
      required onChanged,
      keyboardType,
      focusable,
      error,
      onTap,
      initialValue})
      : _labelText = labelText,
        _onChanged = onChanged,
        _keyboardType = keyboardType,
        _focusable = focusable ?? true,
        _error = error,
        _onTap = onTap,
        _initialValue = initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: _labelText,
          errorText: _error),
      onChanged: _onChanged,
      keyboardType: _keyboardType,
      focusNode: _focusable ? null : AlwaysDisabledFocusNode(),
      onTap: _onTap,
      initialValue: _initialValue,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
