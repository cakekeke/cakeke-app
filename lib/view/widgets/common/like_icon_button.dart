import 'package:cakeke/blocs/like/like_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeIconButton extends StatelessWidget {
  const LikeIconButton({super.key, required this.store, this.iconSize = 20});

  final Store store;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikeState>(buildWhen: (previous, current) {
      return previous.likeStoreList?.length != current.likeStoreList?.length;
    }, builder: (context, state) {
      final listStore =
          BlocProvider.of<LikeBloc>(context).state.likeStoreList ?? [];
      final isLikeStore =
          listStore.where((list) => list.id == store.id).isNotEmpty;

      return GestureDetector(
        onTap: () {
          if (isLikeStore) {
            context.read<LikeBloc>().add(LikeEventRemoveLike(store: store));
          } else {
            context.read<LikeBloc>().add(LikeEventAddLike(store: store));
          }
        },
        child: isLikeStore
            ? Icon(
                Icons.favorite,
                size: iconSize,
                color: DesignSystem.colors.appPrimary,
              )
            : Icon(
                Icons.favorite_border,
                size: iconSize,
                color: DesignSystem.colors.appPrimary,
              ),
      );
    });
  }
}
