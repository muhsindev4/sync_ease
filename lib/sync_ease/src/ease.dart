import 'package:flutter/material.dart';

/// The Ease class provides a simple state management system with additional features
/// such as error handling, loading state, and batch operations.
class Ease<T> {
  T _value;
  VoidCallback? _listener;
  dynamic _error;
  bool _isLoading = false;

  /// Constructor for creating a new instance of Ease with an initial value.
  Ease(this._value);

  /// Getter for retrieving the current value of Ease.
  T get value => _value;

  /// Setter for updating the value of Ease and notifying listeners.
  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _listener?.call();
    }
  }

  /// Getter for retrieving the current error state of Ease.
  dynamic get error => _error;

  /// Setter for updating the error state of Ease and notifying listeners.
  set error(dynamic error) {
    _error = error;
    _listener?.call();
  }

  /// Clears the current error state of Ease and notifies listeners.
  void clearError() {
    _error = null;
    _listener?.call();
  }

  /// Getter for retrieving the current loading state of Ease.
  bool get isLoading => _isLoading;

  /// Setter for updating the loading state of Ease and notifying listeners.
  set isLoading(bool loading) {
    _isLoading = loading;
    _listener?.call();
  }

  /// Adds a listener function to be called when the state changes.
  void addListener(VoidCallback listener) {
    _listener = listener;
  }

  /// Removes a listener function to stop receiving state change notifications.
  void removeListener(VoidCallback listener) {
    _listener = null;
  }

  /// Resets the state to a default value or the initial value and notifies listeners.
  void reset({T? defaultValue}) {
    _value = defaultValue ?? _value;
    _listener?.call();
  }

  /// Updates the state with a new value using the provided update function.
  /// Maintains immutability by creating a new instance of the value.
  void update(Function(T value) updateFunction) {
    final newValue = _value;
    updateFunction(newValue);
    _value = newValue;
    _listener?.call();
  }

  /// Adds a value to the state. Throws an error if the state is not a List.
  void add(dynamic value) {
    if (_value is List) {
      (_value as List).add(value);
    } else {
      throw ArgumentError(
          'Ease of type ${T} cannot add values of type ${value.runtimeType}');
    }
    _listener?.call();
  }

  /// Maps each element in the list to a new value using the provided mapper function.
  List<U> map<U>(U Function(T value) mapper) {
    return (_value as List<T>).map(mapper).toList();
  }

  /// Filters the list based on the provided predicate function.
  List<T> filter(bool Function(T value) predicate) {
    return (_value as List<T>).where(predicate).toList();
  }
}
