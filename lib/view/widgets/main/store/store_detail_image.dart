import 'package:flutter/material.dart';

class StoreDetailImage extends StatelessWidget {
  const StoreDetailImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
