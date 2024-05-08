import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BLEDevice {
  final DiscoveredDevice _device;
  final QualifiedCharacteristic _pitchCharacteristic;

  BLEDevice(this._device)
      : _pitchCharacteristic = QualifiedCharacteristic(
          serviceId: _devParamServiceId,
          characteristicId: _pitchCharId,
          deviceId: _device.id,
        );

  static final FlutterReactiveBle _bleInst = FlutterReactiveBle();

  static final Uuid _devParamServiceId =
      Uuid.parse('83c56551-8976-4160-87d8-b42f5adb22a6');
  static final Uuid _pitchCharId =
      Uuid.parse('1d136203-d1df-4f56-9836-8299e70b6746');

  static final StreamController<Set<BLEDevice>> _streamController =
      StreamController<Set<BLEDevice>>.broadcast();

  static final Set<BLEDevice> currentDevices = <BLEDevice>{};
  static BLEDevice? displayedDevice;

  static void _addConnectedDevice(BLEDevice device) {
    currentDevices.add(device);
    _streamController.add(currentDevices.toSet());
  }

  static void _removeConnectedDevice(BLEDevice device) {
    currentDevices.remove(device);
    _streamController.add(currentDevices.toSet());
  }

  static Stream<Set<BLEDevice>> get currentDevicesStream {
    return _streamController.stream;
  }

  static Future<void> disconnectAll() async {
    await Future.wait(
      <Future<void>>[
        for (BLEDevice device in currentDevices) device.disconnect(),
      ],
    );
  }

  bool isConnected = false;
  StreamSubscription<ConnectionStateUpdate>? _connectionStateStreamSub;

  String get id => _device.id;
  int get rssi => _device.rssi;
  String get name => _device.name;

  Future<void> connect() async {
    //See https://pub.dev/packages/flutter_reactive_ble#establishing-connection for why [connectToAdvertisingDevice] was used
    final Stream<ConnectionStateUpdate> connectionStream =
        _bleInst.connectToDevice(
      id: _device.id,
    );

    final Completer<void> isConnectedComplete = Completer<void>();
    _connectionStateStreamSub = connectionStream.listen(
      (ConnectionStateUpdate event) {
        if (event.connectionState == DeviceConnectionState.connected) {
          isConnected = true;

          if (!isConnectedComplete.isCompleted) {
            isConnectedComplete.complete();
          }
        } else if (event.connectionState ==
            DeviceConnectionState.disconnected) {
          isConnected = false;
        }
      },
    );

    await isConnectedComplete.future;
    _addConnectedDevice(this);
    await _bleInst.requestMtu(deviceId: _device.id, mtu: 150);
  }

  Future<void> disconnect() async {
    await _connectionStateStreamSub?.cancel();
    if (this == BLEDevice.displayedDevice) {
      BLEDevice.displayedDevice = null;
    }
    _removeConnectedDevice(this);
  }

  double _bytesToFloat(List<int> byteData) {
    assert(byteData.length == 4);

    final Uint8List data = Uint8List.fromList(byteData);
    return data.buffer.asFloat32List(0, 1).first;
  }

  List<double> _bytesToFloatList(List<int> byteData) {
    assert(byteData.length % 4 == 0);

    final Uint8List data = Uint8List.fromList(byteData);
    return data.buffer.asFloat32List().toList(growable: false);
  }

  // Returns a stream of pitch values one at a time
  Stream<double> pitchStream() {
    return _bleInst
        .subscribeToCharacteristic(_pitchCharacteristic)
        .expand<double>((List<int> bytes) {
      return _bytesToFloatList(bytes);
    });
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! BLEDevice) {
      return false;
    }

    return _device.id == other._device.id;
  }

  @override
  int get hashCode => _device.id.hashCode;
}

extension BoolToInt on bool {
  int toInt() {
    return this ? 1 : 0;
  }
}

extension IntToBool on int {
  bool toBool() {
    return this != 0;
  }
}
