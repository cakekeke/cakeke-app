import 'package:cakeke/blocs/tab/tab_bloc.dart';
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
          padding: const EdgeInsets.fromLTRB(20, 9, 12, 9),
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
                  context.read<TabBloc>().add(TabChanged(selectedIndex: 4));
                },
                child: const Icon(
                  Icons.person_outline_rounded,
                  color: Colors.black,
                  size: 24,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
