import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class ScaffoldDetailAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ScaffoldDetailAppbar({
    super.key,
    this.appBarText,
    this.onBackButtonPressed,
  });

  final String? appBarText;
  final VoidCallback? onBackButtonPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        appBarText!,
        style: DesignSystem.typography.title3(),
      ),
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          if (onBackButtonPressed != null) {
            onBackButtonPressed!();
          } else {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Icon(Icons.arrow_back, color: DesignSystem.colors.textPrimary),
        ),
      ),
    );
  }
}
