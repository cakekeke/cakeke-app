import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_item.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tab_view_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(bodyWidget: BlocBuilder<CustomBloc, CustomState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: LindiStickerWidget(
                controller: state.controller,
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      state.selectBackground,
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ),
            DefaultTabController(
              length: 6,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      CustomTabItem(title: '배경'),
                      CustomTabItem(title: '촛불'),
                      CustomTabItem(title: '크림'),
                      CustomTabItem(title: '과일'),
                      CustomTabItem(title: '스티커'),
                      CustomTabItem(title: '문자'),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(children: [
                      CustomTabViewList(
                          addAssetList: state.background,
                          onTap: (asset) {
                            context.read<CustomBloc>().add(
                                SetBackgroundEvent(selectBackground: asset));
                          }),
                      CustomTabViewList(
                        addAssetList: state.sticker['candle'] ?? [],
                        onTap: (asset) {
                          if (mounted) {
                            state.controller.addWidget(
                              Image.asset(asset),
                            );
                          }
                        },
                      ),
                      CustomTabViewList(
                        addAssetList: state.sticker['cream'] ?? [],
                        onTap: (asset) {
                          if (mounted) {
                            state.controller.addWidget(
                              Image.asset(asset),
                            );
                          }
                        },
                      ),
                      CustomTabViewList(
                        addAssetList: state.sticker['fruit'] ?? [],
                        onTap: (asset) {
                          if (mounted) {
                            state.controller.addWidget(
                              Image.asset(asset),
                            );
                          }
                        },
                      ),
                      CustomTabViewList(
                        addAssetList: state.sticker['sticker'] ?? [],
                        onTap: (asset) {
                          if (mounted) {
                            state.controller.addWidget(
                              Image.asset(asset),
                            );
                          }
                        },
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.all(12),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: '문자를 입력해주세요.',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 18),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (text) {
                              if (text.isNotEmpty && mounted) {
                                state.controller.addWidget(
                                  Text(text),
                                );
                              }
                            },
                          )),
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
