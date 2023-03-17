import 'package:breathe_app/feature/chronometer/di/chronometer_factory.dart';
import 'package:breathe_app/feature/home/components/default_home_bottom_sheet.dart';
import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog.dart';
import 'package:breathe_app/support/extensions/state_extension.dart';
import 'package:flutter/material.dart';

import '../../model/session.dart';
import 'components/handle_session_dialog/handle_session_dialog_view_model.dart';
import 'home_view.dart';
import 'home_view_model.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  set longPressedSessionId(int longPressedSessionId);
  void Function()? onTapFloatingActionButton;
  void Function()? onConfirmBottomSheet;
  void Function(String textContent)? onDeleteSessionBottomSheet;
  void Function(Session session)? onTapSession;
  void Function(int sessionId)? onLongTapSession;
  void getSessions();
}

abstract class HandleSessionDialogViewProtocol extends HandleSessionDialogViewModelProtocol {
  void Function()? onDismissDialog;
  void Function()? onConfirmDialog;
  void Function(String textContent)? onShowSnackBarDialog;
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
    _bindViewModelFunctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getSessions();
    return HomeView(viewModel: widget.homeViewModel);
  }

  void _bindViewModelFunctions() {
    _bindHomeViewModelFunctions();
    _bindHandleSessionDialogViewModelFunctions();
  }

  void _bindHomeViewModelFunctions() {
    HomeViewProtocol homeViewModel = widget.homeViewModel;
    
    homeViewModel.onTapFloatingActionButton = () => _showDialog();
    homeViewModel.onTapSession = ((session) => _goToChronometerScreen(session));
    homeViewModel.onDeleteSessionBottomSheet = (textContent) => _showSnackBar(textContent);
    homeViewModel.onConfirmBottomSheet = () =>  _popBack();
    homeViewModel.onLongTapSession = (sessionId) {
      _getSelectedSessionId(sessionId);
      _showModalBottomSheet();
    };
  }

  void _bindHandleSessionDialogViewModelFunctions() {
    HandleSessionDialogViewProtocol handleSessionDialogViewModel = widget.handleSessionDialogViewModel;

    handleSessionDialogViewModel.onShowSnackBarDialog = (textContent) => _showSnackBar(textContent);
    handleSessionDialogViewModel.onDismissDialog = () =>  _popBack();
    handleSessionDialogViewModel.onConfirmDialog = () => _changeFocus();
  }

  void _showDialog() {
    showDialog(context: context, builder: (context) {
        return HandleSessionDialog(viewModel: widget.handleSessionDialogViewModel);
    });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context, 
        builder: (context) {
          return DefaultHomeBottomSheet(viewModel: widget.homeViewModel,);
        }
    );
  }

  void _goToChronometerScreen(Session session) {
    Navigator.pushNamed(
        context, ChronometerFactory.route, arguments: session
      );
  }

  void _showSnackBar(String textContent) => showTextSnackBar(textContent);

  void _popBack() => Navigator.pop(context);

  void _getSelectedSessionId(int sessionId) {
    widget.homeViewModel.longPressedSessionId = (sessionId);
  }

  void _changeFocus() => FocusScope.of(context).requestFocus(FocusNode());

  void _getSessions() => widget.homeViewModel.getSessions();
}