import 'dart:ui';

class Colors {
  Colors._();

  static final Colors _instance = Colors._();

  static Colors get instance => _instance;

  Color get appPrimary => const Color(0xFFF7476C);

  // text
  Color get textPrimary => const Color(0xFF000000);

  Color get textSecondary => const Color(0xFF8B8B8B);

  Color get textTertiary => const Color(0xFFC0C0C0);

  Color get textDisabled => const Color(0xFFDBDBDB);

  // background
  Color get backgroundDisabled => const Color(0xFFF3F3F3);

  Color get divider => const Color(0xFFE8E8E8);
}
