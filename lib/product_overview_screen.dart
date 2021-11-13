import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vestr_poc/products_screen.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as DashboardProduct;

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
          ),
          title: Row(
            children: [
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ImageIcon(AssetImage('assets/images/frame.png'))),
                Text(product.name,
                    style: TextStyle(
                        color: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle!
                            .color)),
                ImageIcon(AssetImage('assets/images/text-only.png'),
                    size: 50, color: Color.fromRGBO(0, 230, 118, 0.88))
              ]),

            ],
          )),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              color: Theme.of(context).cardColor,
              child: Text(
                "${product.components.length} titles",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
