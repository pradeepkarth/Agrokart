import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/app/base_cubit.dart';
import 'package:myapp/core/constants/app_strings.dart';

/// BaseScaffoldManager provides hooks for app update, network connectivity, and controls common UI elements.
abstract class BaseScaffoldManager extends StatefulWidget {
  const BaseScaffoldManager({super.key});

  @override
  BaseScaffoldManagerState createState();
}

abstract class BaseScaffoldManagerState<T extends BaseScaffoldManager> extends State<T> {
  late final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    onInit();
  }

  /// Called when the app starts or the manager is initialized.
  void onInit() {}

  /// Called when the app update is detected (override for custom logic).
  void onAppUpdateAvailable() {}

  /// Called when network connectivity changes.
  void onConnectivityChanged(ConnectivityResult result) {}

  /// Internal handler for connectivity changes.
  void _onConnectivityChanged(ConnectivityResult result) {
    onConnectivityChanged(result);
    if (result == ConnectivityResult.none) {
      onNetworkDisconnected();
      showSnackbar('No internet connection');
    }
  }

  /// Called when network is disconnected.
  void onNetworkDisconnected() {}

  /// Show a snackbar message.
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

    static void showDefaultErrorSnackbar(BuildContext context, {String? message}) {
      // Import your app strings/constants file at the top if not already
      // import 'package:myapp/core/constants/app_constants.dart';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message ?? AppStrings.unexpectedError),
          backgroundColor: Colors.red,
        ),
      );
    }


  /// Default AppBar, can be overridden or muted by returning null.
  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Agrokart'),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  /// Enable FloatingActionButton. Child can override to enable.
  @protected
  bool get enableFAB => false;

  /// Enable BottomNavigationBar. Child can override to enable.
  @protected
  bool get enableBottomBar => false;

  /// Default FloatingActionButton, only shown if enabled.
  @protected
  Widget buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
    );
  }

  /// Default BottomNavigationBar, only shown if enabled.
  @protected
  Widget buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }

  /// Child must provide the Cubit to listen for error states.
  @protected
  BaseCubit? get baseCubit => null;

  /// Main scaffold body.
  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final cubit = baseCubit;
    Widget body = buildBody(context);
    if (cubit != null) {
      body = BlocListener<BaseCubit, BaseState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is ErrorState) {
            showDefaultErrorSnackbar(context, message: state.message);
          }
        },
        child: body,
      );
    }
    return Scaffold(
      appBar: buildAppBar(context),
      body: body,
      floatingActionButton: enableFAB ? buildFAB(context) : null,
      bottomNavigationBar: enableBottomBar ? buildBottomBar(context) : null,
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
