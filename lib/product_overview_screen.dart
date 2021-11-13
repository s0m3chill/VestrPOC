import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vestr_poc/confirm_order_screen.dart';
import 'package:vestr_poc/products_screen.dart';
import "component_details_screen.dart";

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as DashboardProduct;

    return Scaffold(
        appBar: AppBar(
            actions: [
              PopupMenuButton(
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                        child: ListTile(title: Text("Quick order"), onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmOrderScreen(),
                                // settings: RouteSettings(arguments: product.components[index]),
                              ));
                        }))
                  ])
            ],
            titleSpacing: 0.0,
            centerTitle: false,
            iconTheme: IconThemeData(
              color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
            ),
            title: Container(
              child:
                Row(children: [
                  Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ImageIcon(AssetImage('assets/images/frame.png'))),
                  Text(product.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle!
                              .color)),
                  Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: ImageIcon(
                          AssetImage('assets/images/text-only.png'),
                          size: 50,
                          color: Color.fromRGBO(0, 230, 118, 0.88)))
                ]),

            )),
        body: Column(children: [
          Column(
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
          Divider(height: 1),
          Expanded(
              child: Container(
            padding: EdgeInsets.zero,
            child: ListView.builder(
              itemCount: product.components.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: (index % 2 == 0)
                        ? Colors.white
                        : Color.fromRGBO(248, 248, 248, 1),
                    child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ComponentDetailsScreen(),
                                settings: RouteSettings(arguments: product.components[index]),
                              ));
                        },
                        leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              product.components[index].enabled
                                  ? ImageIcon(
                                      AssetImage(
                                          'assets/images/check-circle-outline.png'),
                                      color: Color.fromRGBO(67, 160, 71, 1))
                                  : ImageIcon(
                                      AssetImage(
                                          'assets/images/outlined-flag.png'),
                                      color: Color.fromRGBO(255, 156, 31, 1))
                            ]),
                        title: Text(product.components[index].name),
                        subtitle: Text(product.components[index].shortName),
                        trailing: ImageIcon(AssetImage(
                            'assets/images/keyboard-arrow-right.png'))));
              },
            ),
          ))
        ]));
  }
}
