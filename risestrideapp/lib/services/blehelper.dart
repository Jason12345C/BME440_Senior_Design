import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:risestride/services/device.dart';
export 'package:flutter_reactive_ble/flutter_reactive_ble.dart' show BleStatus;

class BLE {
  static final FlutterReactiveBle _bleInst = FlutterReactiveBle();

  static const Duration _timeout = Duration(seconds: 10);

  static Stream<BleStatus> status() {
    return _bleInst.statusStream;
  }

  static Stream<BLEDevice> scan() {
    return _bleInst
        .scanForDevices(
          withServices: [
            Uuid.parse('83c56551-8976-4160-87d8-b42f5adb22a6'),
          ],
          scanMode: ScanMode.lowLatency
        )
        .map((DiscoveredDevice event) => BLEDevice(event))
        .timeout(
          _timeout,
          onTimeout: (EventSink<BLEDevice> sink) {
            sink.close();
          },
        );
  }
}
