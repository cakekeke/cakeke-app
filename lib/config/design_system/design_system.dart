import 'package:cakeke/config/design_system/colors.dart';
import 'package:cakeke/config/design_system/typographies/text_styles.dart';
import 'package:cakeke/config/design_system/typographies/typographies.dart';

abstract class DesignSystem {
  static Colors get colors => Colors.instance;
  static TextStyles get textStyle => TextStyles.instance;
  static Typographies get typography => Typographies.instance;
}
