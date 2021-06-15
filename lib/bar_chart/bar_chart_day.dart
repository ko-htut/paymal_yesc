import 'package:admin/pie_chart/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChartDay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartDayState();
}

class BarChartDayState extends State<BarChartDay> {
  final Color blue = const Color(0xff00bdef);
  final Color orange = const Color(0xffffb647);

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        padding: const EdgeInsets.only(left: 32,right: 32),
        child: Column(
          children: [
            Text('Daily Report',style:TextStyle(color: Colors.black, fontSize: 18)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    barTouchData: BarTouchData(
                      enabled: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(color: Colors.black87, fontSize: 12),
                        margin: 10,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return '23';
                            case 1:
                              return '24';
                            case 2:
                              return '25';
                            case 3:
                              return '26';
                            case 4:
                              return '27';
                            case 5:
                              return '28';
                            case 6:
                              return '29';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        interval: 500,
                        reservedSize: 50,
                        getTitles: (val)=>val.toString(),
                        getTextStyles: (value) => const TextStyle(
                            color: Colors.black,
                            fontSize: 12),
                        margin: 8,
                      ),
                    ),
                    gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 500 == 0,
                        drawHorizontalLine: true,
                        getDrawingHorizontalLine: (value) {

                          return FlLine(
                            color: Color(0xffe7e4e4),
                            strokeWidth: 1,
                          );
                        }
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border(
                          top: BorderSide(color: Color(0xffe7e4e4)),
                          bottom: BorderSide(color: Color(0xffe7e4e4)),
                        )
                    ),
                    groupsSpace: 12,
                    maxY: 2500,
                    // axisTitleData: FlAxisTitleData(
                    //   topTitle: AxisTitle(
                    //     titleText: 'Monthly Electricity Bill by Region Report'
                    //   ),
                    //
                    // ),
                    barGroups: getData(),
                  ),
                ),
                // child: SfCircularChart(
                //
                // ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indicator(
                  color: blue,
                  text: 'MPSS',
                  isSquare: true,
                ),
                SizedBox(width: 12,),
                Indicator(
                  color: orange,
                  text: 'Bank',
                  isSquare: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    double width=18;
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 600,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 600, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 900,width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 900, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 680,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 680, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1020,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1020, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 880,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 880, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1320,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1320, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 840,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 840, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1260,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1260, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 1120,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1120, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1680,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1680, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 1000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1000, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1500,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1500, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 720,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 720, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 1080,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 1080, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}




