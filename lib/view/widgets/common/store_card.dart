import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/score_widget.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      store.name,
                      style: DesignSystem.typography.heading3(
                          const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    true
                        ? Icon(
                            Icons.favorite,
                            size: 20,
                            color: DesignSystem.colors.appPrimary,
                          )
                        : Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: DesignSystem.colors.appPrimary,
                          )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    ScoreWidget(score: 3.5),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "${store.startTime} ~ ${store.endTime}",
                  style: DesignSystem.typography.body2(),
                ),
                const SizedBox(height: 8),
                Text(
                  store.roadAddress,
                  style: DesignSystem.typography.body2(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
