import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/home/home_store_card.dart';
import 'package:flutter/material.dart';

class HomeStoreList extends StatelessWidget {
  const HomeStoreList(
      {super.key, required this.title, required this.storeList});

  final String title;
  final List<Store> storeList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: storeList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: HomeStoreCard(
                  store: storeList[index],
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
