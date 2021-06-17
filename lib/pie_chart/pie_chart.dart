import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class PieChartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 500,
            alignment: Alignment.centerLeft,
            child: Text('Service Region Report',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          Container(
            width: double.infinity,
            height: 270,
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                    setState(() {
                      final desiredTouch =
                          pieTouchResponse.touchInput is! PointerExitEvent &&
                              pieTouchResponse.touchInput is! PointerUpEvent;
                      if (desiredTouch &&
                          pieTouchResponse.touchedSection != null) {
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      } else {
                        touchedIndex = -1;
                      }
                    });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 2,
                  sections: showingSections()),
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Indicator(
                    color: Color(0xff4672c4),
                    text: '(YESC) Yangon Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xffa5a5a5),
                    text: '(ESE) Ayeyarwaddy Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff5b9bd4),
                    text: '(ESE) Kaya Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff264477),
                    text: '(ESE) Magway Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff636363),
                    text: '(ESE) Nay Pyi Taw Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff296192),
                    text: '(ESE) Shan Electricity Bill',
                    isSquare: true,
                  ),
                ],
              ),
              SizedBox(width: 32,),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Indicator(
                    color: Color(0xffec7b30),
                    text: '(MESC) Mandalay Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xffffc002),
                    text: '(ESE) Bago Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff6eac45),
                    text: '(ESE) Kayin Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff9e4a11),
                    text: '(ESE) Mon Electricity Bill',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Indicator(
                    color: Color(0xff9b7505),
                    text: '(ESE) Sagaing Electricity Bill',
                    isSquare: true,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    List<double> value=[15,10,8,22,30,40,10,30,20,30,30];
    double sum=value.fold(0, (previousValue, element) => previousValue+element);
    return List.generate(11, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 16.0 : 10.0;
      final radius = isTouched ? 130.0 : 120.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xffa4a4a4),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            radius: radius,
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffffbf00),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff5a9ad4),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff6fac46),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff254377),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: const Color(0xff9b4408),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            color: const Color(0xff626262),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 7:
          return PieChartSectionData(
            color: const Color(0xff997200),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 8:
          return PieChartSectionData(
            color: const Color(0xff245d90),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 9:
          return PieChartSectionData(
            color: const Color(0xff4371c3),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 10:
          return PieChartSectionData(
            color: const Color(0xffec7c30),
            value: value[i],
            title: (value[i]/sum*100).toStringAsFixed(1)+'%',
            showTitle: true,
            titlePositionPercentageOffset: 0.8,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
