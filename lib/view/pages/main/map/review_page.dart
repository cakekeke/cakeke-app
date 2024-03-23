import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/review/review_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        appBarText: "리뷰",
        isDetailPage: true,
        backgroundColor: DesignSystem.colors.white,
        onBackButtonPressed: () {
          context.read<MapBloc>().add(const MapPageChanged(selectedPage: 2));
        },
        bodyWidget: BlocBuilder<ReviewBloc, ReviewState>(
            buildWhen: (previous, current) {
          return previous.storeReviewList?.hashCode !=
              current.storeReviewList?.hashCode;
        }, builder: (context, state) {
          return ListView.builder(
              itemCount: state.storeReviewList?.length ?? 0,
              itemBuilder: (context, index) {
                final review = state.storeReviewList!.elementAt(index);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 32),
                        child: ReadMoreText(
                          (review.contents ?? '').replaceAll(RegExp("\n"), ""),
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '더보기',
                          trimExpandedText: '접기',
                          style: DesignSystem.typography.body(),
                          textAlign: TextAlign.start,
                          moreStyle:
                              DesignSystem.typography.body(const TextStyle(
                            color: Color(0xFF6F6F6F),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          )),
                        )),
                    if (state.storeReviewList!.length - 1 != index)
                      Divider(
                        thickness: 6,
                        color: DesignSystem.colors.dividerCard,
                      )
                  ],
                );
              });
        }));
  }
}
