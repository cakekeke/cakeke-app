import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
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
            context.read<MypageBloc>().add(
                  MypagePageChanged(
                    selectedPage: MypageTab.voc.index,
                  ),
                );
          },
          color: DesignSystem.colors.appPrimary,
          textColor: DesignSystem.colors.white,
        );
      },
    );
  }
}
