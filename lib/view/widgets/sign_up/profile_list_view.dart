import 'package:cakeke/blocs/sign_up/sign_up_bloc.dart';
import 'package:cakeke/blocs/sign_up/sign_up_event.dart';
import 'package:cakeke/view/widgets/sign_up/profile_image_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context
                  .read<SignUpBloc>()
                  .add(ProfileIdChangedEvent(profileId: index));
            },
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
              child: ProfileImageCircle(index: index),
            ),
          );
        });
  }
}
