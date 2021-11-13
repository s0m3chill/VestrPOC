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
  final ButtonStyle _raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final Divider _divider = Divider(
    color: Colors.grey,
    height: 2,
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
          Container(
            height: 100,
            child: ElevatedButton(
              style: _raisedButtonStyle,
              onPressed: () {},
              child: Text('ADD ASSET'),
            ),
          ),
          _divider,
          Row(
            children: [
              RaisedButton(
                onPressed: () {},
                textColor: Colors.green,
                color: Colors.green.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(3)),
                child: Text("BUY"),
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.red,
                color: Colors.red.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(3)),
                child: Text("SELL"),
              ),
            ],
          ),
          _divider,
          Row(
            children: [
              SimpleAutocompleteFormField<String>(
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
                        .where(
                            (letter) => search.toLowerCase().contains(letter))
                        .toList(),
              ),
              SimpleAutocompleteFormField<String>(
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
                        .where(
                            (letter) => search.toLowerCase().contains(letter))
                        .toList(),
              ),
            ],
          ),
          _divider,
          Row(
            children: [
              Column(
                children: [Text("Cash indicative"), Text("CHF 500.0")],
              ),
              Column(
                children: [Text("Cash available"), Text("CHF 500.0")],
              ),
            ],
          ),
          _divider,
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            child: Text("CONFIRM ORDER"),
          ),
        ],
      ),
    );
  }
}
