import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return Container(
          height: 51,
          padding: const EdgeInsets.fromLTRB(20, 9, 16, 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/common/cakeke_logo.png'),
                width: 90,
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/like_store');
                  },
                  child: Icon(
                    Icons.favorite_border,
                    size: 24,
                    color: DesignSystem.colors.appPrimary,
                  ))
            ],
          ),
        );
      },
    );
  }
}
