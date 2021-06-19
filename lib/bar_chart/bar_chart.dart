import 'package:admin/pie_chart/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<BarChartWidget> {
  final Color blue = const Color(0xff4371c3);
  final Color orange = const Color(0xffec7d31);
  final Color grey = const Color(0xffa4a4a4);
  final formatter = NumberFormat('###,###');

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio:2,
      child: Container(
        padding: const EdgeInsets.only(left: 32,right: 32),
        child: Column(
          children: [
            Text('Monthly Meter Consuming Amount',style:TextStyle(color: Colors.black, fontSize: 18)),
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
                              return 'January';
                            case 1:
                              return 'February';
                            case 2:
                              return 'March';
                            case 3:
                              return 'April';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        interval: 100000,
                        reservedSize: 50,
                        getTitles: (val)=>formatter.format(val),
                        getTextStyles: (value) => const TextStyle(
                            color: Colors.black,
                            fontSize: 12),
                        margin: 8,
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      checkToShowHorizontalLine: (value) => value % 100000 == 0,
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
                    groupsSpace: 30,
                    maxY: 600000,
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
                  text: 'AYA Bank',
                  isSquare: true,
                ),
                SizedBox(width: 12,),
                Indicator(
                  color: orange,
                  text: 'CB Bank',
                  isSquare: true,
                ),
                SizedBox(width: 12,),
                Indicator(
                  color: grey,
                  text: 'KBZ Bank',
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
              y: 430000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 430000, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 240000,width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 240000, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 200000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 200000, grey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 250000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 250000, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 440000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 440000, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 200000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 200000, grey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 350000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 350000, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 180000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 180000, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 300000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 300000, grey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 450000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 450000, blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 280000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 280000, orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 500000,
              width: width,
              rodStackItems: [
                BarChartRodStackItem(0, 500000, grey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}




