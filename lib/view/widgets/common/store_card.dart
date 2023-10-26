import 'package:cakeke/view/widgets/common/score_widget.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/splash.png"),
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
                      "케이크",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    true
                        ? Icon(
                            Icons.favorite,
                            size: 20,
                            color: Color(0xffF7476C),
                          )
                        : Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Color(0xffF7476C),
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
                  "10:00 ~ 22:00",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "서울특별시 강남구 역삼동 123-45",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
