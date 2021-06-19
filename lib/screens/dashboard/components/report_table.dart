import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart'
    hide DataPagerDelegate;

class ReportTable extends StatefulWidget {
  const ReportTable({Key? key}) : super(key: key);

  @override
  _ReportTableState createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  List<ReportModel> _reportList = [];
  late ReportDataSource reportDataSource;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reportList = getReportModel();
    reportDataSource = ReportDataSource(employeeData: _reportList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfDataGrid(
            source: reportDataSource,
            columnWidthMode: ColumnWidthMode.lastColumnFill,
            stackedHeaderRows: _getStackedHeaderRows(),
            columns: getGridColumn(),
            allowSwiping: true,
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: SfTheme.of(context).dataPagerThemeData.backgroundColor,
              border: Border(
                  top: BorderSide(
                      width: .5,
                      color:
                          SfTheme.of(context).dataGridThemeData.gridLineColor),
                  bottom: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none)),
          child: Align(alignment: Alignment.center, child: _buildDataPager()),
        )
      ],
    );
  }

  Widget _buildDataPager() {
    return SfDataPagerTheme(
      data: SfDataPagerThemeData(
        // brightness: model.themeData.brightness,
        // selectedItemColor: model.backgroundColor,
        selectedItemColor: Color(0xff00447b),
        itemBorderRadius: BorderRadius.zero,
        itemColor: Colors.black54,
      ),
      child: SfDataPager(
        delegate: reportDataSource,
        pageCount: reportDataSource._employeeData.length /
            reportDataSource._rowsPerPage,
        direction: Axis.horizontal,
      ),
    );
  }
}

Widget _getWidgetForStackedHeaderCell(String title) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      color: tableHeader,
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ));
}

List<StackedHeaderRow> _getStackedHeaderRows() {
  List<StackedHeaderRow> _stackedHeaderRows;
  _stackedHeaderRows = <StackedHeaderRow>[
    StackedHeaderRow(cells: [
      StackedHeaderCell(columnNames: [
        'corporate',
        'mpss',
        'total',
      ], child: _getWidgetForStackedHeaderCell('Service Charges (MMK)')),
    ])
  ];
  return _stackedHeaderRows;
}

List<ReportModel> getReportModel() {
  return [
    ReportModel(
        id: 1,
        startDate: '17/05/2021\n09:43:59',
        endDate: '17/05/2021\n09:44:20',
        transactionId: 'ADB89010',
        corporationId: 'AYA001',
        corporationName: 'AYA',
        serviceRegion: 'YESC(YGN..Bill)',
        township: 'Bahan',
        meterNo: 'F-34798',
        name: 'U Thein Aung',
        barcodeNo: '1811067754',
        meterConsumingAmount: '12,500',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '12,500',
        paymentMethod: 'AYA',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),
    ReportModel(
        id: 2,
        startDate: '17/05/2021\n09:42:59',
        endDate: '17/05/2021\n09:43:20',
        transactionId: 'ADB90823',
        corporationId: 'PM006',
        name: 'U Kyi Zin',
        corporationName: 'Paymal',
        serviceRegion: 'MESC(Mandalay..Bill)',
        township: 'Mandalay',
        meterNo: '1410734',
        barcodeNo: '363-008047',
        meterConsumingAmount: '20,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '20,500',
        paymentMethod: 'MPU',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),
    ReportModel(
        id: 3,
        startDate: '17/05/2021\n09:41:59',
        name: 'U Thura',
        endDate: '17/05/2021\n09:42:20',
        transactionId: 'ADB9010',
        corporationId: 'CB566',
        corporationName: 'CB',
        serviceRegion: 'ESE(Bago..Bill)',
        township: 'Bago',
        meterNo: 'YD-55509',
        barcodeNo: '6221209685',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),
    ReportModel(
        id: 4,
        startDate: '16/06/2021\n09:40:59',
        endDate: '16/06/2021\n09:43:59',
        transactionId: 'AD89013',
        corporationId: 'PM006',
        corporationName: 'Paymal',
        serviceRegion: '(YESC) Yangon Electricity Bill',
        township: 'Yangon',
        meterNo: 'C-34801',
        name: 'Daw Cho Cho',
        barcodeNo: '2101069759',
        meterConsumingAmount: '23,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'Paymal',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),
    ReportModel(
        id: 5,
        startDate: '16/06/2021\n08:42:59',
        endDate: '16/06/2021\n08:44:59',
        transactionId: 'AD89014',
        corporationId: 'CB006',
        name: 'U Aung Myint',
        corporationName: 'CB',
        serviceRegion: '(YESC) Yangon Electricity Billl',
        township: 'Yangon',
        meterNo: 'F-34802',
        barcodeNo: '62412107',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),
    ReportModel(
        id: 6,
        name: 'U Min Min',
        startDate: '16/06/2021\n08:33:59',
        endDate: '16/06/2021\n08:34:59',
        transactionId: 'AD89015',
        corporationId: 'PM005',
        corporationName: 'Paymal',
        serviceRegion: '(YESC) Yangon Electricity Billl',
        township: 'Yangon',
        meterNo: 'M-54803',
        barcodeNo: '626121014',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),  
        ReportModel(
        id: 7,
        startDate: '16/06/2021\n08:33:59',
        endDate: '16/06/2021\n08:34:59',
        transactionId: 'AD89029',
        corporationId: 'PM005',
        corporationName: 'Paymal',
        serviceRegion: '(ESE) Nay Pyi Taw Electricity Bill',
        township: 'Nay Pyi Taw',
        meterNo: 'M-54803',
        barcodeNo: '626121014',
        name: 'Daw Khine Khine',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'), 
         ReportModel(
        id: 8,
        startDate: '16/06/2021\n08:33:59',
        endDate: '16/06/2021\n08:34:59',
        transactionId: 'AD89028',
        corporationId: 'PM005',
        corporationName: 'Paymal',
        serviceRegion: '(ESE) Mon Electricity Bill',
        township: 'MLM',
        name: 'U Nyi Htwe',
        meterNo: 'N-34816',
        barcodeNo: '6221210165',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),  
        ReportModel(
        id: 9,
        startDate: '13/06/2021\n09:41:59',
        endDate: '13/06/2021\n09:42:00',
        transactionId: 'AD89028',
        name: 'U Kyaw Thu',
        corporationId: 'CB006',
        corporationName: 'CB',
        serviceRegion: '(ESE) Magway Electricity Bill',
        township: 'Magway',
        meterNo: 'F-34815',
        barcodeNo: '6241210130',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),   
         ReportModel(
        id: 10,
        name: 'U Min Kha',
        startDate: '13/06/2021\n09:41:59',
        endDate: '13/06/2021\n09:42:00',
        transactionId: 'AD89025',
        corporationId: 'CB006',
        corporationName: 'CB',
        serviceRegion: '(ESE) Kaya Electricity Bill',
        township: 'Kaya',
        meterNo: 'M-34013',
        barcodeNo: '6221210111',
        meterConsumingAmount: '30,000',
        scCor: '200',
        scMPSS: '300',
        scTotal: '500',
        netAmount: '30,500',
        paymentMethod: 'CB',
        statusCode: '001',
        status: 'SUCCESS',
        reason: '-'),  
  ];
}

List<GridTextColumn> getGridColumn() {
  return <GridTextColumn>[
    gridText('id', 'No'),
    gridText('startDate', 'Start Date/Time'),
    gridText('endDate', 'End Date/Time'),
    gridText('transactionId', 'Transaction ID'),
    gridText('corporationId', 'Corporate ID'),
    gridText('corporationName', 'Corporate Name'),
    gridText('name', 'Biller Name'),
    gridText('serviceRegion', 'Service Region'),
    gridText('township', 'Township'),
    gridText('meterNo', 'Meter No.'),
    gridText('barcodeNo', 'Barcode/CNP/Ref No.'),
    gridText('meterConsumingAmount', 'Meter Consuming Amount(MMK)'),
    gridText('corporate', 'Corporate'),
    gridText('mpss', 'MPSS'),
    gridText('total', 'Total'),
    gridText('netAmount', 'Net Amount (MMK)'),
    gridText('paymentMethod', 'Payment Method'),
    gridText('statusCode', 'Status Code'),
    gridText('status', 'Status'),
    gridText('reason', 'Reason'),
  ];
}

GridTextColumn gridText(String colName, String label) {
  return GridTextColumn(
      columnName: colName,
      label: Container(
          padding: EdgeInsets.all(8.0),
          color: headerColor,
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
            overflow: TextOverflow.visible,
          )));
}

class ReportModel {
  final int id;
  final String startDate;
  final String endDate;
  final String transactionId;
  final String corporationId;
  final String corporationName;
  final String serviceRegion;
  final String township;
  final String meterNo;
  final String barcodeNo;
  final String meterConsumingAmount;
  final String scCor;
  final String scMPSS;
  final String scTotal;
  final String netAmount;
  final String paymentMethod;
  final String statusCode;
  final String name;
  final String status;
  final String reason;

  ReportModel({
    required this.id,
    required this.startDate,
    required this.name,
    required this.endDate,
    required this.transactionId,
    required this.corporationId,
    required this.corporationName,
    required this.serviceRegion,
    required this.township,
    required this.meterNo,
    required this.barcodeNo,
    required this.meterConsumingAmount,
    required this.scCor,
    required this.scMPSS,
    required this.scTotal,
    required this.netAmount,
    required this.paymentMethod,
    required this.statusCode,
    required this.status,
    required this.reason,
  });
}

class ReportDataSource extends DataGridSource {
  ReportDataSource({required List<ReportModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'startDate', value: e.startDate),
              DataGridCell<String>(columnName: 'endDate', value: e.endDate),
              DataGridCell<String>(
                  columnName: 'transactionId', value: e.transactionId),
              DataGridCell<String>(
                  columnName: 'corporationId', value: e.corporationId),
              DataGridCell<String>(
                  columnName: 'corporationName', value: e.corporationName),
      DataGridCell<String>(
          columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'serviceRegion', value: e.serviceRegion),
              DataGridCell<String>(columnName: 'township', value: e.township),
              DataGridCell<String>(columnName: 'meterNo', value: e.meterNo),
              DataGridCell<String>(columnName: 'barcodeNo', value: e.barcodeNo),
              DataGridCell<String>(
                  columnName: 'meterConsumingAmount',
                  value: e.meterConsumingAmount),
              DataGridCell<String>(columnName: 'scCor', value: e.scCor),
              DataGridCell<String>(columnName: 'scMPSS', value: e.scMPSS),
              DataGridCell<String>(columnName: 'scTotal', value: e.scTotal),
              DataGridCell<String>(columnName: 'netAmount', value: e.netAmount),
              DataGridCell<String>(
                  columnName: 'paymentMethod', value: e.paymentMethod),
              DataGridCell<String>(
                  columnName: 'statusCode', value: e.statusCode),
              DataGridCell<String>(columnName: 'status', value: e.status),
              DataGridCell<String>(columnName: 'reason', value: e.reason),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];
  final int _rowsPerPage = 3;

  @override
  List<DataGridRow> get rows => _employeeData;

  int realIndex = -1;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final list = row.getCells();

    return DataGridRowAdapter(
        cells: List.generate(list.length, (index) {
      if (index == 0) {
        realIndex += 1;
      }
      Color rowColor = Color(0xffdfdfdf);
      if (realIndex.isOdd) {
        rowColor = Color(0xffefefef);
      } else {
        rowColor = Color(0xffdfdfdf);
      }
      return Container(
        alignment: Alignment.center,
        color: rowColor,
        padding: EdgeInsets.all(4.0),
        child: Text(
          list[index].value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      );
    }).toList());
  }
}
