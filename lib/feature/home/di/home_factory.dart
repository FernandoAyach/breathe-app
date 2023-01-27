import 'package:flutter/material.dart';

import '../home_controller.dart';
import '../home_view_model.dart';

class HomeFactory {
  static const String route = "/home";

  static StatefulWidget home() {
    final viewModel = HomeViewModel();
    return HomeController(viewModel: viewModel);
  }
}