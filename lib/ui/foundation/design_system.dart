import 'package:cakeke/ui/foundation/colors.dart';
import 'package:cakeke/ui/foundation/typographies/text_styles.dart';
import 'package:cakeke/ui/foundation/typographies/typographies.dart';

abstract class DS {
  static Colors get colors => Colors.instance;
  static TextStyles get textStyle => TextStyles.instance;
  static Typographies get typography => Typographies.instance;
}
