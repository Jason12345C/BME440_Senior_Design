import 'dart:async';
import 'package:flutter/material.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/pages/activity.dart';
import 'package:risestride/services/blehelper.dart';
import 'package:risestride/services/device.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({super.key});

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  final Set<BLEDevice> scannedDevices = <BLEDevice>{};
  late final StreamSubscription<BLEDevice> scanSubscription;

  @override
  void initState() {
    super.initState();

    scanSubscription = BLE.scan().listen((BLEDevice device) {
      setState(() {
        scannedDevices.add(device);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    scanSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        runSpacing: 25.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Text(
              "Connect to RyseStride",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              foregroundColor: Colors.black,
              backgroundColor: ThemeColors.primaryColor1,
              shape: const StadiumBorder(),
            ),
            child: const Text("Scan Device"),
            onPressed: () {
              setState(
                () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopup(context, scannedDevices, true),
                  );
                },
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              foregroundColor: Colors.black,
              backgroundColor: ThemeColors.primaryColor1,
              shape: const StadiumBorder(),
            ),
            child: const Text("Remove Device"),
            onPressed: () {
              setState(
                () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopup(context, BLEDevice.currentDevices, false),
                  );
                },
              );
            },
          ),
          for (BLEDevice device in BLEDevice.currentDevices)
            ConnectionButton(device: device),

          // SafeArea(
          //     child: Scaffold(
          //         body: SfCartesianChart(
          //             series: <LineSeries<chartData, int>>[
          //       LineSeries<chartData, int>(
          //         dataSource: Metrics.pitchValues,
          //         color: const Color.fromRGBO(192, 108, 132, 1),
          //         xValueMapper: (chartData data, _) => data.time,
          //         yValueMapper: (chartData data, _) => data.zValue,
          //       )
          //     ],
          //             primaryXAxis: const NumericAxis(
          //                 majorGridLines: MajorGridLines(width: 0),
          //                 edgeLabelPlacement: EdgeLabelPlacement.shift,
          //                 interval: 3,
          //                 title: AxisTitle(text: 'Time (seconds)')),
          //             primaryYAxis: const NumericAxis(
          //                 axisLine: AxisLine(width: 0),
          //                 majorTickLines: MajorTickLines(size: 0),
          //                 title: AxisTitle(text: 'Pitch degree')))))
        ],
      ),
    );
  }
}

class ConnectionButton extends StatefulWidget {
  const ConnectionButton({required this.device, super.key});
  final BLEDevice device;

  @override
  State<ConnectionButton> createState() => _ConnectionButtonState();
}

class _ConnectionButtonState extends State<ConnectionButton> {
  bool connected = !(BLEDevice.displayedDevice == null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(350, 50),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        foregroundColor: Colors.black,
        backgroundColor: ThemeColors.primaryColor1,
        shape: const StadiumBorder(),
      ),
      child: connected
          ? Text("${widget.device.name}: Connected")
          : Text("${widget.device.name}: Disconnected"),
      onPressed: () {
        setState(() {
          connected = !connected;
          connected
              ? BLEDevice.displayedDevice = widget.device
              : BLEDevice.displayedDevice = null;
          if (connected) {
            Activity.reset();
          }
        });
      },
    );
  }
}

Dialog _buildPopup(BuildContext context, Set<BLEDevice> devices, bool connect) {
  return Dialog(
    elevation: 16,
    child: ListView(
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(
          height: 50,
          child: connect
              ? const Text("Available Devices")
              : const Text("Current Devices"),
        ),
        connect ? _addItem(context, devices) : _removeItem(context, devices),
        const SizedBox(height: 20),
      ],
    ),
  );
}

Widget _addItem(BuildContext context, Set<BLEDevice> devices) {
  final List<SizedBox> popupDisplay = <SizedBox>[];
  for (int i = 0; i < devices.length; i++) {
    popupDisplay.add(
      SizedBox(
        height: 50,
        child: TextButton(
          child: Text(devices.elementAt(i).name),
          onPressed: () async {
            Navigator.of(context).pop();
            await devices.elementAt(i).connect();
          },
        ),
      ),
    );
  }
  return Column(children: popupDisplay);
}

Widget _removeItem(BuildContext context, Set<BLEDevice> devices) {
  final List<SizedBox> popupDisplay = <SizedBox>[];

  for (int i = 0; i < devices.length; i++) {
    if (BLEDevice.displayedDevice?.name != devices.elementAt(i).name) {
      popupDisplay.add(
        SizedBox(
          height: 50,
          child: TextButton(
            child: Text(devices.elementAt(i).name),
            onPressed: () async {
              Navigator.of(context).pop();
              await devices.elementAt(i).disconnect();
            },
          ),
        ),
      );
    }
  }
  return Column(children: popupDisplay);
}
