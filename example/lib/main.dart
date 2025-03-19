import 'package:flutter/material.dart';
import 'package:shake_action/shake_action.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ShakeAction shakeAction;

  @override
  void initState() {
    super.initState();

    // Initialize shake detection
    shakeAction = ShakeAction(onShake: () {
      print("Phone Shaken! Performing an action...");
    });

    shakeAction.startListening();
  }

  @override
  void dispose() {
    shakeAction.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Shake Action Demo")),
        body: Center(child: Text("Shake your phone!")),
      ),
    );
  }
}
