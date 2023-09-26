import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class ScaffoldLayout extends StatelessWidget {
  const ScaffoldLayout({
    super.key,
    this.appBarText,
    required this.bodyWidget,
  });

  final String? appBarText;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarText != null
          ? AppBar(
              elevation: 0,
              title: Text(
                appBarText!,
                style: DesignSystem.typography.title3(),
              ),
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Icon(Icons.arrow_back,
                      color: DesignSystem.colors.textPrimary),
                ),
              ),
            )
          : null,
      body: bodyWidget,
    );
  }
}
