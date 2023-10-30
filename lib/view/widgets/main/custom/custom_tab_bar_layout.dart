import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_item.dart';
import 'package:flutter/material.dart';

class CustomTabBarLayout extends StatelessWidget {
  const CustomTabBarLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.colors.white,
      child: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: DesignSystem.colors.appPrimary,
        unselectedLabelColor: DesignSystem.colors.textTabDisabled,
        labelColor: DesignSystem.colors.black,
        unselectedLabelStyle: DesignSystem.typography.body(),
        labelStyle: DesignSystem.typography
            .body(const TextStyle(fontWeight: FontWeight.w700)),
        tabs: const [
          CustomTabItem(title: '배경'),
          CustomTabItem(title: '사진'),
          CustomTabItem(title: '문구'),
          CustomTabItem(title: '크림'),
          CustomTabItem(title: '촛불'),
          CustomTabItem(title: '과일'),
          CustomTabItem(title: '스티커'),
        ],
      ),
    );
  }
}
