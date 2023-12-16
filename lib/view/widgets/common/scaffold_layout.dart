import 'package:cakeke/view/widgets/common/scaffold_detail_appbar.dart';
import 'package:cakeke/view/widgets/common/scaffold_main_appbar.dart';
import 'package:flutter/material.dart';

class ScaffoldLayout extends StatelessWidget {
  const ScaffoldLayout({
    super.key,
    this.appBarText,
    this.isSafeArea = false,
    this.isDetailPage = false,
    this.onBackButtonPressed,
    this.backgroundColor,
    required this.bodyWidget,
  });

  final String? appBarText;
  final Widget bodyWidget;
  final bool isSafeArea;
  final bool isDetailPage;
  final VoidCallback? onBackButtonPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? appBar;

    if (appBarText != null) {
      if (isDetailPage) {
        appBar = ScaffoldDetailAppbar(
          appBarText: appBarText!,
          onBackButtonPressed: onBackButtonPressed,
        );
      } else {
        appBar = ScaffoldMainAppbar(appBarText: appBarText!);
      }
    }
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: isSafeArea
          ? SafeArea(
              child: bodyWidget,
            )
          : bodyWidget,
    );
  }
}
