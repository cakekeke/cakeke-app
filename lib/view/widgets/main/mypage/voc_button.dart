import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/data/arguments/webView.dart';
import 'package:cakeke/view/widgets/common/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VOCButton extends StatelessWidget {
  const VOCButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        return CustomElevatedButton(
          title: 'VOC',
          onTap: () {
            Navigator.pushNamed(context, Routes.webView,
                arguments: WebViewScreenArguments(
                  url:
                      "https://docs.google.com/forms/d/e/1FAIpQLSd1us0dtey-MI3UooRGqe-K3K1N2m3sMuA7669c5GOz1lsMxQ/viewform",
                  title: "VOC",
                ));
          },
          color: DesignSystem.colors.appPrimary,
          textColor: DesignSystem.colors.white,
        );
      },
    );
  }
}
