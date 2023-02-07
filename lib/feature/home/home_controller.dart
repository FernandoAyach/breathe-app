import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog.dart';
import 'package:flutter/material.dart';

import 'components/handle_session_dialog/handle_session_dialog_view_model.dart';
import 'home_view.dart';
import 'home_view_model.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getSessions();
  void Function()? onTapFloatingActionButton;
}

class HomeController extends StatefulWidget {
  final HomeViewModel homeViewModel;
  final HandleSessionDialogViewModel handleSessionDialogViewModel;

  const HomeController({
    super.key, 
    required this.homeViewModel, 
    required this.handleSessionDialogViewModel
  });

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
    return HomeView(viewModel: widget.homeViewModel);
  }

  void _bind() {
    widget.homeViewModel.onTapFloatingActionButton = () {
      showDialog(context: context, builder: (context) {
        return HandleSessionDialog(viewModel: widget.handleSessionDialogViewModel);
      });
    };
  }

  void _getSessions() {
    widget.homeViewModel.getSessions();
  }
}