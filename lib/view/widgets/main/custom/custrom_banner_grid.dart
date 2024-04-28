import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomBannerGrid extends StatelessWidget {
  final Function(CustomEvent) event;

  const CustomBannerGrid({super.key, required this.event});

  final colorList = const [
    Color(0xffFFFFFF),
    Color(0xffFF805F),
    Color(0xffFFFF45),
    Color(0xff66FF95),
    Color(0xff618BFF),
    Color(0xffB576FF),
    Color(0xffFF7BDD),
    Color(0xffFF4A4A),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.colors.white,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: EdgeInsets.zero,
          itemCount: colorList.length,
          itemBuilder: (context, index) {
            final color = colorList[index];
            return GestureDetector(
              onTap: () {
                event(AddCustomEvent(
                    asset: color.toString(),
                    widget: Container(
                      width: 360,
                      height: 200,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xff000000), width: 1)),
                    )));
              },
              child: Container(
                margin: const EdgeInsets.all(27),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(999)),
                  color: color,
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
