import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/custom/custom_save_button.dart';
import 'package:cakeke/view/widgets/main/custom/custom_sticker_list.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_bar_layout.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_view_list.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_color_grid_view.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({super.key});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  void initState() {
    context.read<CustomBloc>().add(const InitImagesEvent());
    super.initState();
  }

  void addSticker(String asset) {
    if (mounted) {
      context.read<CustomBloc>().add(AddStickerEvent(asset: asset));
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
                  LindiStickerWidget(
                    controller: state.controller,
                    child: SizedBox.expand(
                        child: Image.asset(
                      state.selectBackground,
                      fit: BoxFit.cover,
                    )),
                  ),
                  Positioned(
                    right: 16,
                    top: 60,
                    child: CustomSaveButton(
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: state.stickerList.isNotEmpty,
              child: Container(
                height: 82,
                color: DesignSystem.colors.backgroundCustomList,
                padding: const EdgeInsets.all(16),
                child: const CustomStickerList(),
              ),
            ),
            DefaultTabController(
              length: 8,
              child: Column(
                children: [
                  const CustomTabBarLayout(),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(children: [
                      CustomTabViewGrid(
                          addAssetList: state.background,
                          onTap: (asset) {
                            context.read<CustomBloc>().add(
                                SetBackgroundEvent(selectBackground: asset));
                          }),
                      Container(),
                      Container(),
                      Column(
                        children: [
                          CustomTextField(
                            onSubmitted: (text) {
                              if (text.isNotEmpty && mounted) {
                                state.controller.addWidget(
                                  Text(text),
                                );
                              }
                            },
                            controller: state.textController,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: CustomTextColorGridView(
                                onColorTap: (color) {
                                  if (state.textController.text.isNotEmpty &&
                                      mounted) {
                                    state.controller.addWidget(
                                      Text(
                                        state.textController.text,
                                        style: TextStyle(color: color),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['cream'] ?? [],
                        onTap: addSticker,
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['candle'] ?? [],
                        onTap: addSticker,
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['fruit'] ?? [],
                        onTap: addSticker,
                      ),
                      CustomTabViewGrid(
                        addAssetList: state.sticker['sticker'] ?? [],
                        onTap: addSticker,
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
