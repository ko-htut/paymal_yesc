import 'package:admin/bar_chart/bar_chart.dart';
import 'package:admin/bar_chart/bar_chart_day.dart';
import 'package:admin/controllers/drawer_index_controller.dart';
import 'package:admin/pie_chart/pie_chart.dart';
import 'package:admin/screens/dashboard/components/date_search.dart';
import 'package:admin/screens/dashboard/components/date_search_report.dart';
import 'package:admin/screens/dashboard/components/report_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final indexController=context.watch<DrawerIndexController>();
    return SafeArea(
      child: Column(
        children: [
          Header(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child:indexController.index==0? Column(
                children: [
                  SizedBox(height: defaultPadding),
                  DateSearch(),
                  SizedBox(height: 32,),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                PieChartWidget()
                              ],
                            ),
                          ),
                          Expanded(child: Column(
                            children: [
                              BarChartWidget(),
                              SizedBox(height: 22,),
                              BarChartDay(),
                            ],
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ):Container(child: Column(
                children: [
                  DateSearchReport(),
                  SizedBox(height: 32,),
                  Expanded(child: ReportTable())
                ],
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
