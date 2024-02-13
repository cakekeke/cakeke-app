import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/utils/webview.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyPage extends StatefulWidget {
  PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
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
      ..loadRequest(Uri.parse("${webviewUrl}privacy"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        return ScaffoldLayout(
          appBarText: "개인정보 처리방침",
          isDetailPage: true,
          onBackButtonPressed: () {
            context.read<MypageBloc>().add(MypagePageChanged(
                  selectedPage: mypageTab.setting.index,
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
