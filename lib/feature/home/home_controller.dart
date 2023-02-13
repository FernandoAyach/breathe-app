import 'package:breathe_app/feature/chronometer/di/chronometer_factory.dart';
import 'package:breathe_app/feature/home/components/default_home_bottom_sheet.dart';
import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog.dart';
import 'package:flutter/material.dart';

import '../../model/session.dart';
import 'components/handle_session_dialog/handle_session_dialog_view_model.dart';
import 'home_view.dart';
import 'home_view_model.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getSessions();
  void Function()? onTapFloatingActionButton;
  void Function()? onConfirmBottomSheet;
  void Function(SnackBar snackbar)? onDeleteSessionBottomSheet;
  void Function(Session session)? onTapSession;
  void Function(int sessionId)? onLongTapSession;
  set longPressedSessionId(int longPressedSessionId);
}

abstract class HandleSessionDialogViewProtocol extends HandleSessionDialogViewModelProtocol {
  void Function()? onDismissDialog;
  void Function()? onConfirmDialog;
  void Function(SnackBar snackbar)? onShowSnackBarDialog;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getSessions();
    return HomeView(viewModel: widget.homeViewModel);
  }

  void _bind() {
    widget.homeViewModel.onTapFloatingActionButton = () {
      showDialog(context: context, builder: (context) {
        return HandleSessionDialog(viewModel: widget.handleSessionDialogViewModel);
      });
    };
    widget.homeViewModel.onTapSession = ((session) {
      Navigator.pushNamed(context, ChronometerFactory.route, arguments: session);
    });
    widget.homeViewModel.onLongTapSession = (sessionId) {
      widget.homeViewModel.longPressedSessionId = (sessionId);
      showModalBottomSheet(
        context: context, 
        builder: (context) {
          return DefaultHomeBottomSheet(viewModel: widget.homeViewModel,);
        });
    };
    widget.handleSessionDialogViewModel.onDismissDialog = () =>  _popBack();
    widget.handleSessionDialogViewModel.onConfirmDialog = () => _changeFocus();
    widget.homeViewModel.onConfirmBottomSheet = () =>  _popBack();
    widget.homeViewModel.onDeleteSessionBottomSheet = (snackBar) => 
    showSnackBar(snackBar);
    widget.handleSessionDialogViewModel.onShowSnackBarDialog = (snackBar) => 
    showSnackBar(snackBar);
  }

  void _getSessions() {
    widget.homeViewModel.getSessions();
  }

  void _changeFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _popBack() {
    Navigator.pop(context);
  }

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}