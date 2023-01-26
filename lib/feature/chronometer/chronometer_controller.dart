import 'package:breathe_app/feature/chronometer/chronometer_view.dart';
import 'package:flutter/material.dart';

abstract class ChronometerViewProtocol extends ChronometerViewModelProtocol {}

class ChronometerController extends StatefulWidget {
  final ChronometerViewProtocol viewModel;

  const ChronometerController({super.key, required this.viewModel});

  @override
  State<ChronometerController> createState() => _ChronometerControllerState();
}

class _ChronometerControllerState extends State<ChronometerController> {

  @override
  Widget build(BuildContext context) {
    return ChronometerView(viewModel: widget.viewModel);
  }
}