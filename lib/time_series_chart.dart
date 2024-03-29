/// Timeseries chart example
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {required this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,
        // Optionally pass in a [DateTimeFactory] used by the chart. The factory
        // should create the same type of [DateTime] as the data provided. If none
        // specified, the default creates local date time.
        dateTimeFactory: const charts.LocalDateTimeFactory(),
        primaryMeasureAxis:
            charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
        secondaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
                new charts.BasicNumericTickProviderSpec(desiredTickCount: 3)),
        customSeriesRenderers: [
          new charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customArea',
              includeArea: true,stacked: true
              ),
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    
    final _rnd = Random();
    
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), _rnd.nextInt(8) + 2),
      new TimeSeriesSales(new DateTime(2017, 9, 26), _rnd.nextInt(30) + 20),
      new TimeSeriesSales(new DateTime(2017, 10, 3), _rnd.nextInt(115) + 80),
      new TimeSeriesSales(new DateTime(2017, 10, 10), _rnd.nextInt(85) + 68),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color.fromRGBO(104, 209, 203, 1)),
        areaColorFn: (_, __) => charts.ColorUtil.fromDartColor(Color.fromRGBO(104, 209, 203, 0.3)),
      )
        ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId)
        ..setAttribute(charts.rendererIdKey, 'customArea')
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
