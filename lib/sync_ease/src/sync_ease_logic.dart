import 'utils.dart';

/// The SyncEaseLogic class manages the registration and retrieval of logic instances for state management.
class SyncEaseLogic {
  /// Registers a new instance of SyncEaseLogic.
  ///
  /// Parameters:
  ///   - syncEaseLogic: The instance of SyncEaseLogic to be registered.
  ///
  /// Returns:
  ///   The registered instance of SyncEaseLogic.
  static reg(SyncEaseLogic syncEaseLogic){
    Utils.registeredLogics[syncEaseLogic.toString()]=syncEaseLogic;
    return  Utils.registeredLogics[syncEaseLogic.toString()];
  }

  /// Retrieves a registered instance of SyncEaseLogic.
  ///
  /// Parameters:
  ///   - syncEaseLogic: The instance of SyncEaseLogic to retrieve.
  ///
  /// Returns:
  ///   The registered instance of SyncEaseLogic, if found.
  static get(SyncEaseLogic syncEaseLogic){
    return  Utils.registeredLogics[syncEaseLogic.toString()];
  }
}
