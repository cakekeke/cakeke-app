import 'dart:ui';

class Colors {
  Colors._();

  static final Colors _instance = Colors._();

  static Colors get instance => _instance;

  Color get appPrimary => const Color(0xFFF7476C);

  Color get black => const Color(0xFF000000);

  Color get white => const Color(0xFFFFFFFF);

  Color get gray400 => const Color(0xFFD4D4D4);

  Color get gray100 => const Color(0xFFE1E1E1);

  Color get allowedGreen => const Color(0xFF4EBE4B);

  Color get unacceptableRed => const Color(0xFFFF7F7F);

  // text
  Color get textPrimary => const Color(0xFF000000);

  Color get textSecondary => const Color(0xFF8B8B8B);

  Color get textTertiary => const Color(0xFFC0C0C0);

  Color get textDisabled => const Color(0xFFDBDBDB);

  Color get textHint => const Color(0xFFAAAAAA);

  Color get textTabDisabled => const Color(0xFF919191);

  Color get textCustomPink => const Color(0xFFFFB9DB);

  Color get textCustomBlue => const Color(0xFFC0E8FF);
  

  // background
  Color get backgroundDisabled => const Color(0xFFF3F3F3);
  Color get backgroundProfileList => const Color(0xFFFAFAFA);
  Color get backgroundCustomList => const Color(0xFFF5F5F5);
  Color get backgroundCustomText => const Color(0xFFF7F7F7);

  Color get divider => const Color(0xFFE8E8E8);
  Color get dividerTab => const Color(0xFFF2F2F2);
}
