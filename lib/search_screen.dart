import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:vestr_poc/order_event.dart';

import 'order.dart';
import 'order_bloc.dart';

class SearchOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<SearchOverviewScreen> {
  List list = ["FB", "AAPL", "AMZN", "NFLX", "GOOGL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GFColors.WHITE,
        body: BlocConsumer<OrderBloc, Order>(
            listener: (BuildContext context, order) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Added order")));
        }, builder: (context, order) {
          return order.name != null
              ? Text(order.name!)
              : GFSearchBar(
                  searchList: list,
                  searchQueryBuilder: (query, list) {
                    return list
                        .where((item) => (item! as String)
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  },
                  overlaySearchListItemBuilder: (item) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            item as String,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "NASDAQ",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                  onItemSelected: (item) {
                    // Navigator.of(context).pop();
                    BlocProvider.of<OrderBloc>(context)
                        .add(OrderEvent.add(new Order(item.toString())));
                  },
                );
        }));
  }
}
