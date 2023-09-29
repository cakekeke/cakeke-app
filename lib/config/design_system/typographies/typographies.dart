import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/widgets.dart';

class Typographies {
  Typographies._();

  static final Typographies _instance = Typographies._();

  static Typographies get instance => _instance;

  TextStyle display1() {
    return _typography(
      textStyle: DesignSystem.textStyle.bold,
      fontSize: 30.0,
      height: 1.33,
      debugLabel: 'display1',
      validations: [FontWeight.w700],
    );
  }

  TextStyle display2() {
    return _typography(
      textStyle: DesignSystem.textStyle.bold,
      fontSize: 26.0,
      height: 1.38,
      debugLabel: 'display2',
      validations: [FontWeight.w700],
    );
  }

  TextStyle heading1([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.bold,
      fontSize: 24.0,
      height: 1.42,
      debugLabel: 'heading1',
      validations: [FontWeight.w600, FontWeight.w700],
    );
  }

  TextStyle heading2([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.bold,
      fontSize: 22.0,
      height: 1.41,
      debugLabel: 'heading2',
      validations: [FontWeight.w600, FontWeight.w700],
    );
  }

  TextStyle heading3([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.bold,
      fontSize: 20.0,
      height: 1.40,
      debugLabel: 'heading3',
      validations: [FontWeight.w600, FontWeight.w700],
    );
  }

  TextStyle title1([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.bold,
      fontSize: 16.0,
      height: 1.50,
      debugLabel: 'title1',
      validations: [FontWeight.w600, FontWeight.w700],
    );
  }

  TextStyle title2([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.bold,
      fontSize: 15.0,
      height: 1.50,
      debugLabel: 'title2',
      validations: [FontWeight.w600, FontWeight.w700],
    );
  }

  TextStyle title3([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.bold,
      fontSize: 14.0,
      height: 1.50,
      debugLabel: 'title3',
      validations: [FontWeight.w500, FontWeight.w600, FontWeight.w700],
    );
  }

  TextStyle body([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.medium,
      fontSize: 16.0,
      height: 1.60,
      debugLabel: 'body',
      validations: [FontWeight.w400, FontWeight.w500],
    );
  }

  TextStyle body2([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.medium,
      fontSize: 14.0,
      height: 1.60,
      debugLabel: 'body',
      validations: [FontWeight.w400, FontWeight.w500],
    );
  }

  TextStyle caption1([TextStyle? textStyle]) {
    return _typography(
      textStyle: textStyle ?? DesignSystem.textStyle.regular,
      fontSize: 12.0,
      height: 1.50,
      debugLabel: 'caption1',
      validations: [FontWeight.w400, FontWeight.w500],
    );
  }

  TextStyle _typography({
    required TextStyle textStyle,
    required double fontSize,
    required double height,
    required String debugLabel,
    required List<FontWeight> validations,
  }) {
    assert(
      validations.contains(textStyle.fontWeight),
      '[Typography - $debugLabel] "${textStyle.fontWeight}" cannot be set.',
    );

    return textStyle.copyWith(
      fontSize: fontSize,
      height: height,
    );
  }
}
