import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SearchOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<SearchOverviewScreen> {
  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GFColors.WHITE,
      body: GFSearchBar(
        searchList: list,
        searchQueryBuilder: (query, list) {
          return list
              .where((item) =>
                  (item! as String).toLowerCase().contains(query.toLowerCase()))
              .toList();
        },
        overlaySearchListItemBuilder: (item) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              item as String,
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
        onItemSelected: (item) {
          setState(() {
            print('$item');
          });
        },
      ),
    );
  }
}
