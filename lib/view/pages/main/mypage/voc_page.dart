import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VocPage extends StatefulWidget {
  const VocPage({super.key});

  @override
  State<VocPage> createState() => _VocPageState();
}

class _VocPageState extends State<VocPage> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://docs.google.com/forms/d/e/1FAIpQLSd1us0dtey-MI3UooRGqe-K3K1N2m3sMuA7669c5GOz1lsMxQ/viewform"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        return ScaffoldLayout(
          appBarText: "VOC",
          isDetailPage: true,
          onBackButtonPressed: () {
            context.read<MypageBloc>().add(MypagePageChanged(
                  selectedPage: MypageTab.main.index,
                ));
          },
          backgroundColor: Colors.white,
          isSafeArea: true,
          bodyWidget: SafeArea(
            child: Stack(
              children: [
                WebViewWidget(
                  controller: controller,
                ),
                if (isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      color: DesignSystem.colors.appPrimary,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
