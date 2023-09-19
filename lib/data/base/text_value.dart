import '../error/input_error.dart';

class TextValue {
  TextValue({
    required this.text,
    this.error,
  });

  final String text;
  final InputError? error;

  TextValue copyWith({
    String? text,
    InputError? error,
  }) =>
      TextValue(
        text: text ?? this.text,
        error: error ?? this.error,
      );

  bool isValid() => error == null;
}
