import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

final actionCodeSettings = ActionCodeSettings(
  url: 'https://reactnativefirebase.page.link',
  handleCodeInApp: true,
  androidMinimumVersion: '1',
  androidPackageName:
      'io.flutter.plugins.flutterfire_ui.flutterfire_ui_example',
  iOSBundleId: 'io.flutter.plugins.flutterfireui.flutterfireUIExample',
);
final emailLinkProviderConfig = EmailLinkProviderConfiguration(
  actionCodeSettings: actionCodeSettings,
);

const String googleClientId = "";
const String facebookClientId = "";
