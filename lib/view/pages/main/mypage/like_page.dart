import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        return ScaffoldLayout(
          appBarText: "찜 목록",
          onBackButtonPressed: () {
            context.read<MypageBloc>().add(const MypagePageChanged(
                  selectedPage: 0,
                ));
          },
          isSafeArea: true,
          bodyWidget: Text("sdfs"),
        );
      },
    );
  }
}
