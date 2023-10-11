import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPhotoLayout extends StatelessWidget {
  const CustomPhotoLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(buildWhen: (previous, current) {
      return previous.photoPath != current.photoPath;
    }, builder: (context, state) {
      return Container(
        color: DesignSystem.colors.backgroundCustomList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.photoPath.isEmpty
                  ? '사진을 업로드 해주세요 *o*'
                  : '사진이 업로드 되었습니다 *o*',
              style: DesignSystem.typography.body(TextStyle(
                  color: DesignSystem.colors.textCustomNoti,
                  fontWeight: FontWeight.w400)),
            ),
            Visibility(
              visible: state.photoPath.isEmpty,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 36, bottom: 12),
                    child: Image.asset('assets/images/icon_custom_camera.png'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.read<CustomBloc>().add(const AddPhotoEvent());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: DesignSystem.colors.borderCustomPhoto),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(Icons.add,
                                color: DesignSystem.colors.borderCustomPhoto),
                          ),
                          Text(
                            '사진 업로드',
                            style: DesignSystem.typography.body(TextStyle(
                                color: DesignSystem.colors.textCustomNoti,
                                fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: state.photoPath.isNotEmpty,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 36),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Opacity(
                        opacity: 0.50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: DesignSystem.colors.white,
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    image: AssetImage(state.photoPath),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CustomBloc>()
                              .add(DeletePhotoEvent(path: state.photoPath));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: DesignSystem.colors.white,
                              ),
                              borderRadius: BorderRadius.circular(34),
                            ),
                          ),
                          child: Text(
                            '삭제',
                            style: DesignSystem.typography.body(TextStyle(
                                color: DesignSystem.colors.white,
                                fontWeight: FontWeight.w400)),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }
}
