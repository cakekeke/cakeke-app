import 'package:cakeke/blocs/filter/filter_bloc.dart';
import 'package:cakeke/blocs/filter/filter_event.dart';
import 'package:cakeke/blocs/filter/filter_state.dart';
import 'package:cakeke/utils/city.dart';
import 'package:cakeke/view/widgets/common/check_button.dart';
import 'package:cakeke/view/widgets/common/expanded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StoreFilter extends StatelessWidget {
  const StoreFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return SizedBox(
          height: 33,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ExpandedButton(
                text: state.selectedCity,
                onPressed: () => showCityModal(context)),
            const SizedBox(width: 8),
            ExpandedButton(
              text: state.selectedDistrict,
              onPressed: () {
                showDistrictModal(context);
              },
            ),
          ]),
        );
      },
    );
  }
}

void showCityModal(BuildContext context) {
  showMaterialModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (context) {
      return BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 33),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SizedBox(
                  width: 60,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                )),
                const SizedBox(height: 24),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 24,
                  children: cities
                      .map((city) => CheckButton(
                            text: city,
                            onTap: () {
                              context
                                  .read<FilterBloc>()
                                  .add(FilterEventSelectCity(city: city));
                              Navigator.pop(context);
                            },
                            value: state.selectedCity == city,
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void showDistrictModal(BuildContext context) {
  showMaterialModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (context) {
      return BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 33),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: SizedBox(
                  width: 60,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                )),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 24,
                        children: cityDistricts[state.selectedCity]!
                            .take((cityDistricts[state.selectedCity]!.length +
                                    1) ~/
                                2)
                            .map((district) => CheckButton(
                                  text: district,
                                  onTap: () {
                                    context.read<FilterBloc>().add(
                                        FilterEventSelectDistrict(
                                            district: district));
                                    Navigator.pop(context);
                                  },
                                  value: state.selectedDistrict == district,
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 24,
                        children: cityDistricts[state.selectedCity]!
                            .skip((cityDistricts[state.selectedCity]!.length +
                                    1) ~/
                                2)
                            .map((district) => CheckButton(
                                  text: district,
                                  onTap: () {
                                    context.read<FilterBloc>().add(
                                        FilterEventSelectDistrict(
                                            district: district));
                                    Navigator.pop(context);
                                  },
                                  value: state.selectedDistrict == district,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
