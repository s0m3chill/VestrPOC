import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'products_screen.dart';

class ComponentDetailsScreen extends StatelessWidget {
  final _prefixes = [
    "Custodian",
    "ISIN",
    "Close",
    "MtM price",
    "CCY",
    "FIGI",
    "Valor",
    "Units AMC",
    "Total units",
    "Position value",
    "% current"
  ];

  @override
  Widget build(BuildContext context) {
    final component = ModalRoute.of(context)!.settings.arguments as Component;

    final propMap = new Map();

    propMap["Custodian"] = component.custodian;
    propMap["ISIN"] = component.isin;
    propMap["Close"] = component.closePrice;
    propMap["MtM price"] = component.mtmPrice;
    propMap["CCY"] = component.currency;
    propMap["FIGI"] = component.figi;
    propMap["Units AMC"] = component.unitsPerAmc;
    propMap["Total units"] = component.totalUnits;
    propMap["Position value"] = component.positionValue;
    propMap["% current"] = component.percentCurrent;
    propMap["Valor"] = component.valor;

    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0.0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
          ),
          title: Container(
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: component.enabled
                      ? ImageIcon(
                          AssetImage('assets/images/check-circle-outline.png'),
                          color: Color.fromRGBO(67, 160, 71, 1))
                      : ImageIcon(AssetImage('assets/images/outlined-flag.png'),
                          color: Color.fromRGBO(255, 156, 31, 1))),
              Column(children: [
                Text(component.name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle!
                            .color)),
              ])
            ]),
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _prefixes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: (index % 2 == 0)
                  ? Colors.white
                  : Color.fromRGBO(248, 248, 248, 1),
              child: ListTile(
                title: Row(children: [
                  Text(_prefixes[index] + " "),
                  Text(propMap[_prefixes[index]],
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.56)))
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
