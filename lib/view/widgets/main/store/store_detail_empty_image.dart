import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreDetailEmptyImage extends StatelessWidget {
  const StoreDetailEmptyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DesignSystem.colors.backgroundStoreEmptyImage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/common/empty_layout.svg',
            width: 120,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            '가게 사진이 없습니다',
            textAlign: TextAlign.center,
            style: DesignSystem.typography.body(TextStyle(
                fontWeight: FontWeight.w400,
                color: DesignSystem.colors.textEmptyImage)),
          ),
        ],
      ),
    );
  }
}
