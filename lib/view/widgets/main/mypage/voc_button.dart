import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/view/widgets/common/gray_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VOCButton extends StatelessWidget {
  const VOCButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        return GrayElevatedButton(
          title: 'VOC',
          onTap: () {
            context.read<MypageBloc>().add(
                  MypagePageChanged(
                    selectedPage: MypageTab.voc.index,
                  ),
                );
          },
        );
      },
    );
  }
}
