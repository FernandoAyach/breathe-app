import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';
import 'home_view_model.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getSessions();
  void Function()? onTapFloatingActionButton;
}

class HomeController extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeController({super.key,required this.viewModel});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  @override
  void initState() {
    _bind();
    _getSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapFloatingActionButton = () {
      showDialog(context: context, builder: (context) {
        return HandleSessionDialog(viewModel: widget.viewModel);
      });
    };
  }

  void _getSessions() {
    widget.viewModel.getSessions();
  }
}