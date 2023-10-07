import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomPhotoLayout extends StatelessWidget {
  const CustomPhotoLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.colors.backgroundCustomList,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '사진을 업로드 해주세요 *o*',
            style: DesignSystem.typography.body(TextStyle(
                color: DesignSystem.colors.textCustomNoti,
                fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 12),
            child: Image.asset('assets/images/icon_custom_camera.png'),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: DesignSystem.colors.borderCustomPhoto),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(Icons.add,
                        color: DesignSystem.colors.borderCustomPhoto),
                  ),
                  Text(
                    '사진 업로드',
                    style: DesignSystem.typography.body(TextStyle(
                        color: DesignSystem.colors.textCustomNoti,
                        fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
