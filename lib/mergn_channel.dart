import 'package:flutter/services.dart';

/// A class that provides methods for interacting with the Mergn SDK via platform channels.
class MergnChannel {
  /// Initializes the Mergn SDK.
  ///
  /// This method invokes the native method `InitializeSdk` and prints the returned message.
  ///
  /// Throws a [PlatformException] if the initialization fails.
  static Future<void> initializeSDK() async {
    const platform = MethodChannel('mergnKotlinSDK');
    try {
      final String message = await platform.invokeMethod('InitializeSdk');
      print(message);
    } on PlatformException catch (e) {
      print("Failed to initialize SDK: '${e.message}'.");
    }
  }

  /// Registers an API call with the provided [apiKey].
  ///
  /// This method invokes the native method `registerAPI` with the API key.
  ///
  /// Throws a [PlatformException] if the registration fails.
  ///
  /// [apiKey]: The API key to register.
  static Future<void> registerAPICall(String apiKey) async {
    const platform = MethodChannel('mergnKotlinSDK');
    try {
      final String message =
          await platform.invokeMethod('registerAPI', {"apiKey": apiKey});
      print(message);
    } on PlatformException catch (e) {
      print("Failed to get register API Method: '${e.message}'.");
    }
  }

  /// Sends an event with the specified [eventName] and [eventProperties].
  ///
  /// This method invokes the native method `sendEvent`.
  ///
  /// Throws a [PlatformException] if the event sending fails.
  ///
  /// [eventName]: The name of the event to send.
  /// [eventProperties]: A map of properties associated with the event.
  static Future<void> sendEvent(
      String eventName, Map<String, String> eventProperties) async {
    const platform = MethodChannel('mergnKotlinSDK');
    try {
      await platform.invokeMethod('sendEvent',
          {"eventName": eventName, "eventProperties": eventProperties});
    } on PlatformException catch (e) {
      print("Failed to send event: '${e.message}'.");
    }
  }

  /// Sends an attribute with the specified [attributeName] and [attributeValue].
  ///
  /// This method invokes the native method `sendAttribute`.
  ///
  /// Throws a [PlatformException] if the attribute sending fails.
  ///
  /// [attributeName]: The name of the attribute to send.
  /// [attributeValue]: The value of the attribute to send.
  static Future<void> sendAttribute(
      String attributeName, String attributeValue) async {
    const platform = MethodChannel('mergnKotlinSDK');
    try {
      await platform.invokeMethod('sendAttribute',
          {"attributeName": attributeName, "attributeValue": attributeValue});
    } on PlatformException catch (e) {
      print("Failed to send attribute: '${e.message}'.");
    }
  }

  /// Logs in with the specified [value].
  ///
  /// This method invokes the native method `login` with the provided email.
  ///
  /// Throws a [PlatformException] if the login fails.
  ///
  /// [value]: The email address of the user to log in.
  static Future<void> login(String value) async {
    const platform = MethodChannel('mergnKotlinSDK');
    try {
      await platform.invokeMethod('login', {"email": value});
    } on PlatformException catch (e) {
      print("Failed to send attribute: '${e.message}'.");
    }
  }

  /// Sends a Firebase token with the specified [value].
  ///
  /// This method invokes the native method `fcm_token`.
  ///
  /// Throws a [PlatformException] if sending the token fails.
  ///
  /// [value]: The Firebase Cloud Messaging token to send.
  static Future<void> firebaseToken(String value) async {
    const platform = MethodChannel('mergnKotlinSDK');
    try {
      await platform.invokeMethod('fcm_token', {"token": value});
    } on PlatformException catch (e) {
      print("Failed to send token: '${e.message}'.");
    }
  }
}
