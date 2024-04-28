import 'package:cakeke/blocs/bloc_providers.dart';
import 'package:cakeke/blocs/review/review_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.storeId});

  final int storeId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.mainPageBlocProviders,
        child: ScaffoldLayout(
          appBarText: "리뷰",
          isDetailPage: true,
          backgroundColor: DesignSystem.colors.white,
          onBackButtonPressed: () {
            Navigator.pop(context);
            context.read<ReviewBloc>().add(const NewStoreSetting());
          },
          bodyWidget:
              BlocBuilder<ReviewBloc, ReviewState>(builder: (context, state) {
            if (state.storeReviewList == null) {
              context
                  .read<ReviewBloc>()
                  .add(StoreReviewFetch(storeId: storeId));
              context
                  .read<ReviewBloc>()
                  .add(StoreReviewCountFetch(storeId: storeId));

              return Center(
                child: CircularProgressIndicator(
                  color: DesignSystem.colors.appPrimary,
                ),
              );
            }
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
                            (review.contents ?? '')
                                .replaceAll(RegExp("\n"), ""),
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
          }),
        ));
  }
}
