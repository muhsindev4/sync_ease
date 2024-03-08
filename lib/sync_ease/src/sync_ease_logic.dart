import 'package:flutter/material.dart';
import 'utils.dart';

/// The SyncEaseLogic class manages the registration and retrieval of logic instances for state management.
class SyncEaseLogic {
  VoidCallback? _listener;

  /// Registers a new instance of SyncEaseLogic.
  ///
  /// Parameters:
  ///   - syncEaseLogic: The instance of SyncEaseLogic to be registered.
  ///
  /// Returns:
  ///   The registered instance of SyncEaseLogic.
  static reg(SyncEaseLogic syncEaseLogic) {
    Utils.registeredLogics[syncEaseLogic.toString()] = syncEaseLogic;
    return Utils.registeredLogics[syncEaseLogic.toString()];
  }

  /// Retrieves a registered instance of SyncEaseLogic.
  ///
  /// Parameters:
  ///   - syncEaseLogic: The instance of SyncEaseLogic to retrieve.
  ///
  /// Returns:
  ///   The registered instance of SyncEaseLogic, if found.
  static get(SyncEaseLogic syncEaseLogic) {
    return Utils.registeredLogics[syncEaseLogic.toString()];
  }

  /// Updates the state and notifies listeners.
  void put() {
    _listener?.call();
    Utils.registeredLogics[toString()] = this;
  }

  /// Adds a listener function to be called when the state changes.
  void addListener(VoidCallback listener) {
    _listener = listener;
  }

  /// Removes a listener function to stop receiving state change notifications.
  void removeListener(VoidCallback listener) {
    _listener = null;
  }
}
