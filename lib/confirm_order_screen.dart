import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T) onChanged;

  AppDropdownInput({
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              // onChanged: {},
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class ConfirmOrderScreen extends StatelessWidget {
  // final ButtonStyle _raisedButtonStyle = TextButton.styleFrom(
  //   primary: Colors.grey[300],
  //   minimumSize: Size(88, 36),
  //   padding: EdgeInsets.symmetric(horizontal: 16),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(2)),
  //   ),
  // );

  final Divider _divider = Divider(
    color: Colors.grey,
    height: 25,
  );

  final _letters = 'abcdefghijklmnopqrstuvwxyz'.split('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromRGBO(0, 0, 0, 0.54), //change your color here
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 14),
              child: (Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('ADD ASSET'),
                    ))
              ]))),
          _divider,
          Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.green.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green, width: 1),
                                borderRadius: BorderRadius.circular(3)),
                            child: Text("BUY"),
                          ))),
                  SizedBox(width: 8),
                  Expanded(
                      child: SizedBox(
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {},
                            textColor: Colors.red,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.red, width: 1),
                                borderRadius: BorderRadius.circular(3)),
                            child: Text("SELL"),
                          ))),
                ],
              )),
          _divider,
          Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: SimpleAutocompleteFormField<String>(
                    initialValue: "0",
                    decoration: InputDecoration(
                        labelText: 'Quantity', border: OutlineInputBorder()),
                    // suggestionsHeight: 200.0,
                    maxSuggestions: 10,
                    itemBuilder: (context, item) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(item!),
                    ),
                    onSearch: (String search) async => search.isEmpty
                        ? _letters
                        : _letters
                            .where((letter) =>
                                search.toLowerCase().contains(letter))
                            .toList(),
                  )),
                  SizedBox(width: 8),
                  Expanded(
                      child: SimpleAutocompleteFormField<String>(
                    initialValue: "Best Effort",
                    decoration: InputDecoration(
                        labelText: 'Order type', border: OutlineInputBorder()),
                    // suggestionsHeight: 200.0,
                    maxSuggestions: 10,
                    itemBuilder: (context, item) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(item!),
                    ),
                    onSearch: (String search) async => search.isEmpty
                        ? _letters
                        : _letters
                            .where((letter) =>
                                search.toLowerCase().contains(letter))
                            .toList(),
                  )),
                ],
              )),
          _divider,
          Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cash indicative",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("CHF 500.0")
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cash available",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("CHF 500.0")
                    ],
                  )),
                ],
              )),
          _divider,
          Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    child: Text("CONFIRM ORDER"),
                  )))
        ],
      ),
    );
  }
}
