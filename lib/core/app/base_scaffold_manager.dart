import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/app/base_cubit.dart';
import 'package:myapp/core/constants/app_strings.dart';

/// BaseScaffoldManager provides hooks for app update, network connectivity, and controls common UI elements.
/// 
/// Extend this widget to create screens with common app-level behaviors such as connectivity monitoring,
/// error handling, and UI scaffolding.
abstract class BaseScaffoldManager extends StatefulWidget {
  /// Creates a [BaseScaffoldManager].
  const BaseScaffoldManager({super.key});

  @override
  BaseScaffoldManagerState createState();
}

/// BaseScaffoldManagerState provides the implementation for [BaseScaffoldManager].
/// 
/// Subclasses should override methods and properties to customize connectivity handling,
/// error state listening, and UI elements such as AppBar, FAB, and BottomNavigationBar.
abstract class BaseScaffoldManagerState<T extends BaseScaffoldManager>
    extends State<T> {
  late final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
    );
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
      showSnackBar('No internet connection');
    }
  }

  /// Called when network is disconnected.
  void onNetworkDisconnected() {}

  /// Show a snackBar message.
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Shows a default error SnackBar with a given [message] or a fallback message.
  ///
  /// Displays a SnackBar in the provided [context] with the error color from the theme.
  /// If [message] is not provided, uses [AppStrings.unexpectedError].
  static void showDefaultErrorSnackBar(
    BuildContext context, {
    String? message,
  }) {
    // Import your app strings/constants file at the top if not already
    // import 'package:myapp/core/constants/app_constants.dart';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? AppStrings.unexpectedError),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  /// Default AppBar, can be overridden or muted by returning null.
  @protected
  PreferredSizeWidget? buildAppBar({String? appName}) =>
      AppBar(title: Text(appName ?? AppStrings.appName), centerTitle: true);

  /// Enable FloatingActionButton. Child can override to enable.
  @protected
  bool get enableFAB => false;

  /// Enable BottomNavigationBar. Child can override to enable.
  @protected
  bool get enableBottomBar => false;

  /// Default FloatingActionButton, only shown if enabled.
  @protected
  Widget buildFAB({VoidCallback? onPressed, IconData? icon}) =>
      FloatingActionButton(
        onPressed: onPressed,
        child: Icon(icon ?? Icons.info),
      );

  /// Default BottomNavigationBar, only shown if enabled.
  @protected
  Widget buildBottomBar() => BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    ],
  );

  /// Child must provide the Cubit to listen for error states.
  /// 
  /// Override this getter in subclasses to provide the specific [BaseCubit] instance
  /// that should be listened to for error handling. Return `null` if no cubit is needed.
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
            showDefaultErrorSnackBar(context, message: state.message);
          }
        },
        child: body,
      );
    }
    return Scaffold(
      appBar: buildAppBar(),
      body: body,
      floatingActionButton: enableFAB ? buildFAB() : null,
      bottomNavigationBar: enableBottomBar ? buildBottomBar() : null,
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
