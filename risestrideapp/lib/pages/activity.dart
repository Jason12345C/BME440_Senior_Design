import 'dart:async';

import 'package:flutter/material.dart';
import 'package:risestride/services/device.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class Activity extends StatefulWidget {
  const Activity({required this.device, Key? key}) : super(key: key);
  final BLEDevice? device;
  static List<chartData> pitchValues = <chartData>[];
  static List<double> samplingData = <double>[];

  static void reset() {
    pitchValues = <chartData>[];
    samplingData = <double>[];
  }

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  late Stream<double>? metricsStream;
  late StreamSubscription<double>? metricsSubscription;
  // late ChartSeriesController _chartSeriesController;
  int time = 0;
  bool isBuzzing = false;
  double threshold = 1;

  @override
  void initState() {
    super.initState();
    metricsStream = BLEDevice.displayedDevice?.pitchStream();
    metricsSubscription = metricsStream?.listen((double data) {
      print("Received data from stream: $data"); // Print received data
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          Activity.pitchValues.add(chartData(time++, data));

          if (Activity.pitchValues.length > 10) {
            Activity.pitchValues.removeAt(0); // Remove the oldest data point
          }

          // Update buzzing status based on stream value
          isBuzzing = data > threshold; // Define threshold value for buzzing
        });
      });
    });
  }

  // void update() {
  //   metricsSubscription = metricsStream?.listen((double data) {
  //     Future.delayed(const Duration(seconds: 1), () {
  //       Activity.pitchValues.add(chartData(time++, data));

  //       if (Activity.pitchValues.length > 10) {
  //         Activity.pitchValues.removeAt(0); // Remove the oldest data point
  //       }

  //       setState(() {});
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (metricsStream == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'No device connected.',
            // ignore: deprecated_member_use
            textScaleFactor: 2,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Scaffold(
          body: SafeArea(
              child: Center(
                  child: Column(children: [
        SizedBox(
            // height of the Container widget
            height: 300,
            // width of the Container widget
            width: 350,
            child: SfCartesianChart(
                series: <LineSeries<chartData, int>>[
                  LineSeries<chartData, int>(
                    dataSource: Activity.pitchValues,
                    color: Color.fromRGBO(9, 6, 171, 1),
                    xValueMapper: (chartData data, _) => data.time,
                    yValueMapper: (chartData data, _) => data.zValue,
                  )
                ],
                primaryXAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 3,
                    title: AxisTitle(text: 'Time (seconds)')),
                primaryYAxis: const NumericAxis(
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Pitch degree')))),
        Container(
            height: 100,
            width: 200,
            child: Center(
                child: Text(isBuzzing ? "Buzzing!" : "Not Buzzing",
                    style: TextStyle(
                        color: isBuzzing ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 35))))
      ]))));
      // SafeArea(
      //     child: Scaffold(
      //         body: SfCartesianChart(
      //             series: <LineSeries<chartData, int>>[
      //       LineSeries<chartData, int>(
      //         dataSource: Activity.pitchValues,
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
      //                 title: AxisTitle(text: 'Pitch degree')))));
    }
  }
}

// ignore: camel_case_types
class chartData {
  chartData(this.time, this.zValue);
  final int time;
  final double zValue;
}
