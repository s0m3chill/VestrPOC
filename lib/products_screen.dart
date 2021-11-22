import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "time_series_chart.dart";
import 'product_overview_screen.dart';

class Component {
  final String name;
  final String shortName;
  final String custodian;
  final String isin;
  final String closePrice;
  final String mtmPrice;
  final String currency;
  final String figi;
  final String valor;
  final String unitsPerAmc;
  final String totalUnits;
  final String positionValue;
  final String percentCurrent;
  final String percentTarget;
  final bool enabled;

  Component(
      this.name,
      this.shortName,
      this.custodian,
      this.isin,
      this.closePrice,
      this.mtmPrice,
      this.currency,
      this.figi,
      this.valor,
      this.unitsPerAmc,
      this.totalUnits,
      this.positionValue,
      this.percentCurrent,
      this.percentTarget,
      this.enabled);
}

class DashboardProduct {
  final String name;
  final String? pendingOrderCount;
  final String status;
  final String outstandingQuantity;
  final String? bid;
  final String? ask;
  final String? mtdChange;
  final List<Component> components;

  DashboardProduct(
      this.name,
      this.pendingOrderCount,
      this.status,
      this.outstandingQuantity,
      this.bid,
      this.ask,
      this.mtdChange,
      this.components);
}

/// This is the stateless widget that the main application instantiates.
class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  static List<Component> _componentList = [
    new Component(
        "APPLE INC",
        "APPL UW",
        "-",
        "CNE0000009T3",
        "160.13",
        "-",
        "CNY",
        "BBG000C4CBY2",
        "-",
        "0.063717",
        "583",
        "EUR 236.03",
        "85.16%",
        "97.66%",
        false),
    new Component(
        "ADOBE INC",
        "ADBE UW",
        "-",
        "CNE0000009T3",
        "211.1",
        "-",
        "EUR",
        "BBG000C4CBY2",
        "-",
        "0.063717",
        "583",
        "EUR 236.03",
        "14.23%",
        "23.68%",
        false),
    new Component(
        "ADIDAS AG",
        "ADS GY",
        "-",
        "CNE0000009T3",
        "100.17",
        "-",
        "USD",
        "BBG000C4CBY2",
        "-",
        "0.063717",
        "583",
        "EUR 236.03",
        "0.61%",
        "0.61%",
        true),
    new Component(
        "AUTODESK AG",
        "ADSK UW",
        "-",
        "CNE0000009T3",
        "151.1",
        "-",
        "USD",
        "BBG000C4CBY2",
        "-",
        "0.063717",
        "583",
        "EUR 236.03",
        "0.00%",
        "-21.94%",
        true)
  ];

  static List<DashboardProduct> _productList = [
    new DashboardProduct(
        "AMC on Global Money",
        "4",
        "Ready for rebalancing",
        "USD 36.17 mio (CHF 35.81 mio) – 210’000 certificates",
        "USD 115.25",
        "USD 116.50",
        "USD 3.3%",
        _componentList),
    new DashboardProduct(
        "Active Manufacturing Certificate",
        null,
        "Ready for rebalancing",
        "CHF 0.13 mio – 1'000 certificates",
        "CHF 120.50",
        "CHF 121.20",
        "CHF 1.0%",
        _componentList),
    new DashboardProduct(
        "Crypto Stars",
        "2",
        "Ready for rebalancing",
        "USD 0.90 mio (CHF 0.83mio) – 5'000 certificates",
        "USD 180.10",
        "USD 180.60",
        "USD 1.0%",
        _componentList),
    new DashboardProduct(
        "AMC on Global e-Business",
        null,
        "Ready for rebalancing",
        "11'600 certificates",
        null,
        null,
        null,
        _componentList),
    new DashboardProduct(
        "AMC on Exotic Asset Types",
        "1",
        "Ready for rebalancing",
        "CHF 0.57mio – 5'600 certificates",
        "CHF 100.50",
        "CHF 101.50",
        "USD 9.9%",
        _componentList)
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
            child: ListView.builder(
      shrinkWrap: true,
      itemCount: _productList.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverviewScreen(),
                        settings: RouteSettings(arguments: _productList[index]),
                      ));
                },
                title: Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ImageIcon(AssetImage('assets/images/frame.png'))),
                  Text(_productList[index].name,
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  _productList[index].pendingOrderCount != null
                      ? Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 20,
                          width: 20,
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            _productList[index].pendingOrderCount!,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        )
                      : Center()
                ]),
                subtitle: Text(_productList[index].status.toUpperCase(),
                    style: TextStyle()),
                trailing:
                    ImageIcon(AssetImage('assets/images/description.png')),
              ),
              Divider(),
              SizedBox(
                child: SimpleTimeSeriesChart.withSampleData(),
                height: 134,
              ),
              Divider(),
              Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_productList[index].outstandingQuantity,
                            style: TextStyle(fontSize: 12)),
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: <Widget>[
                                Row(children: [
                                  Text('Bid ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      )),
                                  _productList[index].bid != null
                                      ? Text(_productList[index].bid!,
                                          style: TextStyle(fontSize: 12))
                                      : Text('-',
                                          style: TextStyle(fontSize: 12)),
                                ]),
                                Spacer(),
                                Row(children: [
                                  Text('Ask ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  _productList[index].ask != null
                                      ? Text(_productList[index].ask!,
                                          style: TextStyle(fontSize: 12))
                                      : (Text("-",
                                          style: TextStyle(fontSize: 12))),
                                ]),
                                Spacer(),
                                Row(children: [
                                  Text('MTD Change ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  _productList[index].mtdChange != null
                                      ? Row(children: [
                                          Text(_productList[index].mtdChange!,
                                              style: TextStyle(fontSize: 12)),
                                          ImageIcon(
                                              AssetImage(
                                                  'assets/images/polygon.png'),
                                              size: 8,
                                              color: Colors.green)
                                        ])
                                      : Text('-',
                                          style: TextStyle(fontSize: 12)),
                                ]),
                                Spacer(),
                              ],
                            ))
                      ])),
            ],
          ),
        );
      },
    )));
  }
}
