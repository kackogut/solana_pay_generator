import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final String _labelText;
  final ValueChanged<String>? _onChanged;
  final TextInputType? _keyboardType;
  final bool _focusable;

  const BaseInput({
    super.key,
    required labelText,
    required onChanged,
    keyboardType,
    focusable,
  })  : _labelText = labelText,
        _onChanged = onChanged,
        _keyboardType = keyboardType,
        _focusable = focusable ?? true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: _labelText,
      ),
      onChanged: _onChanged,
      keyboardType: _keyboardType,
      focusNode: _focusable ? null : AlwaysDisabledFocusNode(),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
