import 'package:flutter/material.dart';

import 'home_view.dart';
import 'home_view_model.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getSessions();
}

class HomeController extends StatefulWidget {
   final HomeViewModel viewModel;

  const HomeController({super.key, required this.viewModel});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  @override
  void initState() {
    _getSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  void _getSessions() {
    widget.viewModel.getSessions();
  }
}