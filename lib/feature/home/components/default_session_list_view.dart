import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';
import 'package:flutter/material.dart';

class DefaultSessionListView extends StatelessWidget {
  final int itemCount;

  const DefaultSessionListView({super.key, required this.itemCount,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return const DefaultSessionItem();
        },
      ),
    );
  }
}
