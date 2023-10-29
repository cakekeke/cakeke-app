import 'package:cakeke/view/widgets/common/empty_widget.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      appBarText: "예약",
      bodyWidget: Center(
        child: EmptyWidget(
          message: "아직 준비 중인 화면입니다.",
        ),
      ),
    );
  }
}
