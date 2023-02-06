import 'package:breathe_app/feature/home/home_view.dart';
import 'package:flutter/material.dart';

class HandleSessionDialog extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HandleSessionDialog({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    scrollable: true,
    title: const Text('Criar nova sessão'),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome da sessão',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Duração',
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [],
  );
  }
}