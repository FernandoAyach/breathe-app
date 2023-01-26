import 'package:breathe_app/feature/cronometer/cronometer_view.dart';
import 'package:flutter/material.dart';

abstract class CronometerViewProtocol extends CronometerViewModelProtocol {}

class CronometerController extends StatefulWidget {
  final CronometerViewProtocol viewModel;

  const CronometerController({super.key, required this.viewModel});

  @override
  State<CronometerController> createState() => _CronometerControllerState();
}

class _CronometerControllerState extends State<CronometerController> {
  @override
  Widget build(BuildContext context) {
    return CronometerView(viewModel: widget.viewModel);
  }
}