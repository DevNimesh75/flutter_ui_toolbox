import 'dart:collection';

/// A lightweight event bus for managing real-time data flow across your Flutter application.
///
/// `LiveStream` enables different parts of your app to communicate seamlessly without tight coupling.
/// It acts as a centralized event dispatcher, allowing multiple subscribers to listen for updates
/// and receive real-time data changes.
///
/// ## Features:
/// - Emit events with data.
/// - Subscribe to events and receive updates instantly.
/// - Retrieve the last emitted value of any event.
/// - Remove individual or all event listeners when no longer needed.
///
/// ## Quick Example:
///
/// ```dart
/// final liveStream = LiveStream();
///
/// // Subscribing to an event
/// liveStream.on("user_updated", (data) {
///   print("User data updated: $data");
/// });
///
/// // Emitting an event
/// liveStream.emit("user_updated", {"name": "John Doe", "age": 30});
///
/// // Retrieving the last emitted value
/// var lastValue = liveStream.getValue("user_updated");
/// print("Last emitted value: $lastValue");
///
/// // Removing a specific event listener
/// liveStream.dispose("user_updated");
///
/// // Clearing all events
/// liveStream.disposeAllKeys();
/// ```
class LiveStream {
  final _DataStore _storage = _DataStore.getInstance();

  /// Emits a new value to the specified [stream].
  ///
  /// If there are active subscribers, they will receive the new value.
  /// If no value is provided, `true` is emitted by default.
  ///
  /// ### Example:
  /// ```dart
  /// final liveStream = LiveStream();
  /// liveStream.emit("user_logged_in", {"username": "JohnDoe"});
  /// ```
  void emit(String stream, [dynamic value]) {
    _storage.setValue(stream, value ?? true);
  }

  /// Subscribes to a [stream] and listens for updates.
  ///
  /// If the stream already has data, the [callback] will be immediately invoked with the latest value.
  ///
  /// ### Example:
  /// ```dart
  /// final liveStream = LiveStream();
  /// liveStream.on("theme_changed", (data) {
  ///   print("Theme changed to: $data");
  /// });
  /// ```
  void on(String stream, void Function(Object)? callback) {
    if (callback != null) {
      _storage.setCallback(stream, callback);
    }
  }

  /// Retrieves the most recent value of a given [stream].
  ///
  /// Returns `null` if no value has been emitted yet.
  ///
  /// ### Example:
  /// ```dart
  /// final liveStream = LiveStream();
  /// liveStream.emit("app_language", "English");
  /// String? language = liveStream.getValue("app_language");
  /// print("Current language: $language");
  /// ```
  Object? getValue(String stream) {
    return _storage.getValue(stream);
  }

  /// Removes a specific [stream] from the data store.
  ///
  /// This stops further updates for this stream.
  ///
  /// ### Example:
  /// ```dart
  /// final liveStream = LiveStream();
  /// liveStream.emit("notification_count", 5);
  /// liveStream.dispose("notification_count");
  /// ```
  void dispose(String key) {
    _storage.removeKey(key);
  }

  /// Clears all stored data and listeners.
  ///
  /// Use this carefully to prevent removing critical event listeners.
  ///
  /// ### Example:
  /// ```dart
  /// final liveStream = LiveStream();
  /// liveStream.emit("dark_mode", true);
  /// liveStream.emit("user_online", true);
  /// liveStream.disposeAllKeys(); // Clears all emitted values and listeners
  /// ```
  void disposeAllKeys() {
    _storage.removeAll();
  }
}

/// Private storage class for managing stream data and subscriptions.
class _DataStore {
  static _DataStore? _instance;

  /// Stores event data and their respective callbacks.
  final HashMap<String, _DataItem> _dataItems = HashMap();

  /// Emits a new [value] to a given [key] (event stream).
  ///
  /// Notifies all registered listeners with the updated value.
  void setValue(String key, dynamic value) {
    _DataItem item = _dataItems.putIfAbsent(key, () => _DataItem());
    item.value = value;

    // Notify all subscribed callbacks
    item.callbacks?.forEach((callback) => callback(value));
  }

  /// Removes a specific event [key] from storage.
  void removeKey(String key) {
    _dataItems.remove(key);
  }

  /// Clears all stored events and subscriptions.
  void removeAll() {
    _dataItems.clear();
  }

  /// Registers a [callback] to listen for updates on a given event [key].
  ///
  /// If the event has a previous value, the callback is triggered immediately.
  void setCallback(String key, Function(Object) callback) {
    _DataItem item = _dataItems.putIfAbsent(key, () => _DataItem());

    item.callbacks ??= [];
    item.callbacks!.add(callback);

    // If there's already a value, notify the new subscriber immediately.
    if (item.value != null) {
      callback(item.value);
    }
  }

  /// Retrieves the last known value for a given event [key].
  Object? getValue(String key) {
    return _dataItems[key]?.value;
  }

  /// Checks if an event [key] exists.
  bool exists(String key) {
    return _dataItems.containsKey(key);
  }

  /// Returns the singleton instance of `_DataStore`.
  static _DataStore getInstance() {
    _instance ??= _DataStore();
    return _instance!;
  }
}

/// Holds event data and registered callback functions.
class _DataItem {
  dynamic value;
  List<Function(Object)>? callbacks;
}
