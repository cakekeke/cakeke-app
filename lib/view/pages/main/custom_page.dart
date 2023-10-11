import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/custom/custom_photo_layout.dart';
import 'package:cakeke/view/widgets/main/custom/custom_save_button.dart';
import 'package:cakeke/view/widgets/main/custom/custom_sticker_list.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_bar_layout.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_view_list.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_field_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({super.key});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  final GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    context.read<CustomBloc>().add(const InitImagesEvent());
    super.initState();
  }

  void addCustomWidget(String asset, {Widget? widget}) {
    if (mounted) {
      context
          .read<CustomBloc>()
          .add(AddCustomEvent(asset: asset, widget: widget));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(bodyWidget: BlocBuilder<CustomBloc, CustomState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  RepaintBoundary(
                    key: globalKey,
                    child: LindiStickerWidget(
                      controller: state.controller,
                      child: SizedBox.expand(
                          child: Image.asset(
                        state.selectBackground,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 60,
                    child: CustomSaveButton(
                      onTap: () {
                        context
                            .read<CustomBloc>()
                            .add(CaptureAndSaveEvent(globalKey: globalKey));
                      },
                    ),
                  )
                ],
              ),
            ),
            DefaultTabController(
              length: 8,
              child: Column(
                children: [
                  const CustomTabBarLayout(),
                  Visibility(
                    visible: state.customList.isNotEmpty,
                    child: Container(
                      height: 82,
                      color: DesignSystem.colors.backgroundCustomList,
                      padding: const EdgeInsets.all(16),
                      child: const CustomStickerList(),
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: state.customList.isNotEmpty ? 245 : 327,
                    child: TabBarView(children: [
                      CustomTabViewGrid(
                          addAssetList: state.background,
                          onTap: (asset) {
                            context.read<CustomBloc>().add(
                                SetBackgroundEvent(selectBackground: asset));
                          }),
                      const CustomPhotoLayout(),
                      Container(),
                      CustomTextFieldLayout(
                        textController: state.textController,
                        addWidget: (text, widget) =>
                            addCustomWidget(text, widget: widget),
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['cream'] ?? [],
                        onTap: addCustomWidget,
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['candle'] ?? [],
                        onTap: addCustomWidget,
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['fruit'] ?? [],
                        onTap: addCustomWidget,
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['sticker'] ?? [],
                        onTap: addCustomWidget,
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
