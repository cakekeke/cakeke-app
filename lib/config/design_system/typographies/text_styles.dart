
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/widgets.dart';

final TextStyle _baseTextStyle = TextStyle(
  color: DesignSystem.colors.textPrimary,
);

class TextStyles {
  TextStyles._();

  static final TextStyles _instance = TextStyles._();

  static TextStyles get instance => _instance;

  final TextStyle regular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  final TextStyle medium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
  );

  final TextStyle semiBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
  );

  final TextStyle bold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
  );
}
