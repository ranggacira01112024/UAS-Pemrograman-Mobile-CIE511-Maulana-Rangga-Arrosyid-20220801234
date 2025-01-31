import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ActivitasScreen extends StatefulWidget {
  @override
  _ActivitasScreenState createState() => _ActivitasScreenState();
}

class _ActivitasScreenState extends State<ActivitasScreen> {
  List<charts.Series<Activitas, String>> _seriesData;

  _generateData() {
    List<Activitas> data = [
      Activitas('Senin', 100),
      Activitas('Selasa', 200),
      Activitas('Rabu', 300),
      Activitas('Kamis', 400),
      Activitas('Jumat', 500),
    ];

    _seriesData.add(
      charts.Series(
        id: 'Aktivitas',
        data: data,
        domainFn: (Activitas activitas, _) => activitas.hari,
        measureFn: (Activitas activitas, _) => activitas.jumlah,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Activitas, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitas'),
      ),
      body: Center(
        child: charts.BarChart(
          _seriesData,
          animate: true,
          animationDuration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}

class Activitas {
  String hari;
  int jumlah;

  Activitas(this.hari, this.jumlah);
}