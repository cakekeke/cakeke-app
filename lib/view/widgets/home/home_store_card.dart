import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/score_widget.dart';
import 'package:flutter/material.dart';

class HomeStoreCard extends StatelessWidget {
  const HomeStoreCard({
    super.key,
    required this.store,
    required this.onTap,
    required this.index,
    required this.isLast,
  });

  final Store store;
  final VoidCallback onTap;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, index == 0 ? 0 : 16, 0, 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isLast
                  ? Colors.transparent
                  : const Color.fromRGBO(0, 0, 0, 0.1),
              width: 1,
            ),
          ),
        ),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: (store.imgUrlList.isEmpty
                            ? const AssetImage("assets/images/logo.png")
                            : NetworkImage(store.imgUrlList.first))
                        as ImageProvider<Object>,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                    child: Text(
                      (index + 1).toString() + ". " + store.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                        child: Text('${store.starRating}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              height: 1,
                            )),
                      ),
                      const SizedBox(width: 4),
                      ScoreWidget(score: store.starRating, size: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 12,
                    child: Text(
                      store.roadAddress,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
