import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/like_icon_button.dart';
import 'package:cakeke/view/widgets/common/score_widget.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store, this.onTap});

  final Store store;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: (store.imgUrlList.isEmpty
                          ? const AssetImage("assets/images/splash.png")
                          : NetworkImage(store.imgUrlList.first))
                      as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          store.name,
                          style:
                              DesignSystem.typography.heading3(const TextStyle(
                            fontWeight: FontWeight.w700,
                            height: 1,
                          )),
                        ),
                        LikeIconButton(store: store)
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Text(
                          '${store.starRating}',
                          style: DesignSystem.typography.body2(
                            const TextStyle(
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      ScoreWidget(score: store.starRating),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${store.startTime} ~ ${store.endTime}",
                    style: DesignSystem.typography.body2(
                      const TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    store.roadAddress,
                    overflow: TextOverflow.ellipsis,
                    style: DesignSystem.typography.body2(
                      const TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
