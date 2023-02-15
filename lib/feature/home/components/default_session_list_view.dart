import 'package:breathe_app/feature/home/components/session_item/default_session_item.dart';
import 'package:flutter/material.dart';

class DefaultSessionListView extends StatelessWidget {
  final List<DefaultSessionItemViewModelProtocol> sessions;

  const DefaultSessionListView({
    super.key,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: sessions.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return DefaultSessionItem(
            viewModel: sessions[index],
          );
        },
      ),
    );
  }
}
