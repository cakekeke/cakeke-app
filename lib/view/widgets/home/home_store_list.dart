import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/home/home_store_card.dart';
import 'package:flutter/material.dart';

class HomeStoreList extends StatelessWidget {
  const HomeStoreList({
    super.key,
    required this.title,
    required this.storeList,
    required this.moveListPage,
  });

  final String title;
  final List<Store> storeList;
  final VoidCallback moveListPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700, height: 1.6),
              ),
              GestureDetector(
                onTap: moveListPage,
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: storeList.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeStoreCard(
                store: storeList[index],
                index: index,
                onTap: () {
                  Navigator.pushNamed(context, '/store_detail',
                      arguments: storeList[index]);
                },
                isLast: index == storeList.length - 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
