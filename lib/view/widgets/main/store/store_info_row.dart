import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class StoreInfoRow extends StatelessWidget {
  const StoreInfoRow({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(title,
                  style: DesignSystem.typography.body2(TextStyle(
                      color: DesignSystem.colors.gray600,
                      fontWeight: FontWeight.w400))),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
