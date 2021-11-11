import 'package:flutter/material.dart';
import "time-series-chart.dart";

/// This is the stateless widget that the main application instantiates.
class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Row(children: <Widget>[Padding(padding: EdgeInsets.only(right: 8), child: ImageIcon(AssetImage('assets/images/frame.png'))), Text('AMC on Global Money', style: TextStyle(fontWeight: FontWeight.w700)), Container(
                margin: EdgeInsets.only(left: 4),
                height: 20,
                width: 20,
                decoration: new BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child:Center(child:Text(
                  "4",
                  style: TextStyle(fontSize: 12,color: Colors.white),
                )),
              )]),
              subtitle: Text('Ready for rebalancing'.toUpperCase(), style: TextStyle()),
              trailing: ImageIcon(AssetImage('assets/images/description.png')),
            ),
            SizedBox(child: SimpleTimeSeriesChart.withSampleData(), height: 134,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}