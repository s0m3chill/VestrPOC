import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipOval(
                          child: CircleAvatar(
                            child: Text('gg'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'descr',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              letterSpacing: 0.3,
                              height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'header',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: false,
                )
              ],
              // expansionCallback: (int item, bool status) {
              //   setState(() {
              //     itemData[index].expanded = !itemData[index].expanded;
              //   });
              // },
            );
          },
        ),
      ),
    );
  }
}
