import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final String _labelText;
  final ValueChanged<String>? _onChanged;
  final TextInputType? _keyboardType;

  const BaseInput(
      {super.key, required labelText, required onChanged, keyboardType})
      : _labelText = labelText,
        _onChanged = onChanged,
        _keyboardType = keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: _labelText,
      ),
      onChanged: _onChanged,
      keyboardType: _keyboardType,
    );
  }
}
