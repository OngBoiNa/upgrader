/*
 * Copyright (c) 2019-2022 Larry Aasen. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only call clearSavedSettings() during testing to reset internal values.
  await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  // On Android, the default behavior will be to use the Google Play Store
  // version of the app.
  // On iOS, the default behavior will be to use the App Store version of
  // the app, so update the Bundle Identifier in example/ios/Runner with a
  // valid identifier already in the App Store.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upgrader Example',
      home: UpgradeAlert(
          upgrader: Upgrader(
            textStyles: UpgradeTextStyles(
                title: TextStyle(backgroundColor: Colors.amber),
                bodyReleaseNotes: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
                message: TextStyle(fontSize: 16, color: Colors.red),
                prompt: TextStyle(
                  backgroundColor: Colors.blueAccent,
                  color: Colors.white,
                ),
                titleReleaseNotes: TextStyle(
                  color: Colors.brown,
                  letterSpacing: 7,
                )),
            dialogStyle: UpgradeDialogStyle.material,
          ),
          child: Scaffold(
            appBar: AppBar(title: Text('Upgrader Example')),
            body: Center(child: Text('Checking...')),
          )),
    );
  }
}