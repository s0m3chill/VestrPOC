import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final _prefixes = [
    "Custodian",
    "ISIN",
    "Close",
    "MtM price",
    "CCY",
    "FIGI",
    "Units AMC",
    "Total units",
    "Position value",
    "% current"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _prefixes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: (index % 2 == 0) ? Colors.white : Colors.grey,
              child: ListTile(
                title: Text(_prefixes[index] + " " + "//ToDo: add Data"),
              ),
            );
          },
        ),
      ),
    );
  }
}
