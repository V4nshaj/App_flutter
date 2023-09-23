import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Battery extends StatefulWidget {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  State<Battery> createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await Battery.platform
          .invokeMethod('BatteryStation'); //static variable
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
