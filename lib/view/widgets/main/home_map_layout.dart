import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HomeMapLayout extends StatelessWidget {
  const HomeMapLayout({
    super.key,
    required this.onMapReady,
  });

  final Function(NaverMapController) onMapReady;

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: const NaverMapViewOptions(
        initialCameraPosition: NCameraPosition(
          target: NLatLng(37.5665, 126.9780),
          zoom: 14,
        ),
      ),
      onMapReady: onMapReady,
    );
  }
}
