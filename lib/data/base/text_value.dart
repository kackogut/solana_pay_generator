import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/input_error.dart';

part 'text_value.freezed.dart';

@freezed
class TextValue with _$TextValue {
  const TextValue._();

  const factory TextValue({
    @Default("") String text,
    @Default(null) InputError? error,
  }) = _TextValue;

  bool isValid() => error == null;
}
