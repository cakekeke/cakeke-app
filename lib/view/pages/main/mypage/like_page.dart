import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
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
          isDetailPage: true,
          onBackButtonPressed: () {
            context.read<MypageBloc>().add(const MypagePageChanged(
                  selectedPage: 0,
                ));
          },
          isSafeArea: true,
          bodyWidget: Container(
            decoration: const BoxDecoration(
              color: Color(0xffF4F4F4),
            ),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        offset: const Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: StoreCard(),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        offset: const Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: StoreCard(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
