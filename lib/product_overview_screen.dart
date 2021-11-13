import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vestr_poc/products_screen.dart';
import "component_details_screen.dart";

class ItemModel {
  bool expanded;
  String headerItem;
  String description;
  Color colorsItem;

  ItemModel({
    this.expanded: false,
    required this.headerItem,
    required this.description,
    required this.colorsItem,
  });
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final section = [
    ItemModel(
        headerItem: 'Stocks', description: 'descr', colorsItem: Colors.grey)
  ];

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as DashboardProduct;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
        ),
        title: Container(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ImageIcon(AssetImage('assets/images/frame.png'))),
              Text(product.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).appBarTheme.titleTextStyle!.color)),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: ImageIcon(
                  AssetImage('assets/images/text-only.png'),
                  size: 50,
                  color: Color.fromRGBO(0, 230, 118, 0.88),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child:
        ListView.builder(
          itemCount: section.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 500),
                dividerColor: Colors.red,
                expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          section[index].headerItem,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ComponentDetailsScreen(),
                                    settings: RouteSettings(
                                        arguments: product.components[0]),
                                  ));
                            },
                            leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  product.components[0].enabled
                                      ? ImageIcon(
                                          AssetImage(
                                              'assets/images/check-circle-outline.png'),
                                          color: Color.fromRGBO(67, 160, 71, 1))
                                      : ImageIcon(
                                          AssetImage(
                                              'assets/images/outlined-flag.png'),
                                          color:
                                              Color.fromRGBO(255, 156, 31, 1))
                                ]),
                            title: Text(product.components[0].name),
                            subtitle: Text(product.components[0].shortName),
                            trailing: ImageIcon(
                              AssetImage(
                                  'assets/images/keyboard-arrow-right.png'),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ComponentDetailsScreen(),
                                    settings: RouteSettings(
                                        arguments: product.components[1]),
                                  ));
                            },
                            leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  product.components[1].enabled
                                      ? ImageIcon(
                                          AssetImage(
                                              'assets/images/check-circle-outline.png'),
                                          color: Color.fromRGBO(67, 160, 71, 1))
                                      : ImageIcon(
                                          AssetImage(
                                              'assets/images/outlined-flag.png'),
                                          color:
                                              Color.fromRGBO(255, 156, 31, 1))
                                ]),
                            title: Text(product.components[1].name),
                            subtitle: Text(product.components[1].shortName),
                            trailing: ImageIcon(
                              AssetImage(
                                  'assets/images/keyboard-arrow-right.png'),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ComponentDetailsScreen(),
                                    settings: RouteSettings(
                                        arguments: product.components[2]),
                                  ));
                            },
                            leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  product.components[2].enabled
                                      ? ImageIcon(
                                          AssetImage(
                                              'assets/images/check-circle-outline.png'),
                                          color: Color.fromRGBO(67, 160, 71, 1))
                                      : ImageIcon(
                                          AssetImage(
                                              'assets/images/outlined-flag.png'),
                                          color:
                                              Color.fromRGBO(255, 156, 31, 1))
                                ]),
                            title: Text(product.components[2].name),
                            subtitle: Text(product.components[2].shortName),
                            trailing: ImageIcon(
                              AssetImage(
                                  'assets/images/keyboard-arrow-right.png'),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ComponentDetailsScreen(),
                                    settings: RouteSettings(
                                        arguments: product.components[3]),
                                  ));
                            },
                            leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  product.components[3].enabled
                                      ? ImageIcon(
                                          AssetImage(
                                              'assets/images/check-circle-outline.png'),
                                          color: Color.fromRGBO(67, 160, 71, 1))
                                      : ImageIcon(
                                          AssetImage(
                                              'assets/images/outlined-flag.png'),
                                          color:
                                              Color.fromRGBO(255, 156, 31, 1))
                                ]),
                            title: Text(product.components[3].name),
                            subtitle: Text(product.components[3].shortName),
                            trailing: ImageIcon(
                              AssetImage(
                                  'assets/images/keyboard-arrow-right.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: section[index].expanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    section[index].expanded = !section[index].expanded;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// class ProductOverviewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final product =
//         ModalRoute.of(context)!.settings.arguments as DashboardProduct;
//
//     return Scaffold(
//       appBar: AppBar(
//           titleSpacing: 0.0,
//           centerTitle: false,
//           iconTheme: IconThemeData(
//             color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
//           ),
//           title: Container(
//             child: Row(children: [
//               Padding(
//                   padding: EdgeInsets.only(right: 8),
//                   child: ImageIcon(AssetImage('assets/images/frame.png'))),
//               Text(product.name,
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color:
//                           Theme.of(context).appBarTheme.titleTextStyle!.color)),
//               Padding(
//                   padding: EdgeInsets.only(left: 8),
//                   child: ImageIcon(AssetImage('assets/images/text-only.png'),
//                       size: 50, color: Color.fromRGBO(0, 230, 118, 0.88)))
//             ]),
//           )),
//       body:
//       Column(children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               padding: EdgeInsets.all(15),
//               color: Theme.of(context).cardColor,
//               child: Text(
//                 "${product.components.length} titles",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           ],
//         ),
//         Divider(height: 1),
//         Expanded(
//             child: Container(
//           padding: EdgeInsets.zero,
//           child: ListView.builder(
//             itemCount: product.components.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                   color: (index % 2 == 0)
//                       ? Colors.white
//                       : Color.fromRGBO(248, 248, 248, 1),
//                   child: ListTile(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ComponentDetailsScreen(),
//                               settings: RouteSettings(
//                                   arguments: product.components[index]),
//                             ));
//                       },
//                       leading: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             product.components[index].enabled
//                                 ? ImageIcon(
//                                     AssetImage(
//                                         'assets/images/check-circle-outline.png'),
//                                     color: Color.fromRGBO(67, 160, 71, 1))
//                                 : ImageIcon(
//                                     AssetImage(
//                                         'assets/images/outlined-flag.png'),
//                                     color: Color.fromRGBO(255, 156, 31, 1))
//                           ]),
//                       title: Text(product.components[index].name),
//                       subtitle: Text(product.components[index].shortName),
//                       trailing: ImageIcon(AssetImage(
//                           'assets/images/keyboard-arrow-right.png'))));
//             },
//           ),
//         ))
//       ]),
//     );
//   }
// }
