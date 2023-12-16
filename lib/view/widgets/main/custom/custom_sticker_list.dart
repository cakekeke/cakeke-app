import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomStickerList extends StatelessWidget {
  const CustomStickerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(
      buildWhen: (previous, current) {
        return previous.customList.length != current.customList.length;
      },
      builder: (context, state) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.controller.widgets.length,
            itemBuilder: (context, index) {
              final widget = state.controller.widgets.elementAt(index);
              return Container(
                constraints: const BoxConstraints(minWidth: 55),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: DesignSystem.colors.white,
                          borderRadius: BorderRadius.circular(999)),
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(top: 6, right: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: widget.child,
                      ),
                    ),
                    Positioned(
                      left: 15,
                      child: GestureDetector(
                        onTap: () {
                          context.read<CustomBloc>().add(DeleteCustomEvent(
                              asset: state.customList.elementAt(index)));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: DesignSystem.colors.white,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
