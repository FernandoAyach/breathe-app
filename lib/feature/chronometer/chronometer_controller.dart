import 'package:breathe_app/feature/chronometer/chronometer_view.dart';
import 'package:breathe_app/support/extensions/state_extension.dart';
import 'package:flutter/material.dart';

abstract class ChronometerViewProtocol extends ChronometerViewModelProtocol {
  void Function()? onTapLeaveSession;
  void Function(String textContent)? onFinishSession;
  void insertSelectedDuration();
}

class ChronometerController extends StatefulWidget {
  final ChronometerViewProtocol viewModel;

  const ChronometerController({super.key, required this.viewModel});

  @override
  State<ChronometerController> createState() => _ChronometerControllerState();
}

class _ChronometerControllerState extends State<ChronometerController> {

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChronometerView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.insertSelectedDuration();
    widget.viewModel.onTapLeaveSession = () => _popBack();
    widget.viewModel.onFinishSession = (textContent) => {
      _popBack(),
      _showSnackBar(textContent)
    };
  }

  void _popBack() {
    Navigator.pop(context);
  }

  void _showSnackBar(String textContent) {
    showTextSnackBar(textContent);
  }
}