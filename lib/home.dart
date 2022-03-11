import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statefull_widget_04/widget/dropdown-button.dart';
import 'package:statefull_widget_04/widget/input.dart';
import 'package:statefull_widget_04/widget/list-view.dart';
import 'widget/result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  List listViewItem = [];

  onDropdownChange(newValue) {
    setState(() {
      _newValue = newValue;
      perhitunganSuhu();
    });
  }

  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;

  var listItem = ["Kelvin", "Reamur", "Fahrenheit", "Celcius"];

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add('Kelvin : $_result');
      } else if (_newValue == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listViewItem.add('Reamur : $_result');
      } else if (_newValue == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
        listViewItem.add('Fahrenheit : $_result');
      } else {
        _result = _inputUser;
        listViewItem.add('Celcius : $_result');
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              title: Text("Konverter Suhu"), backgroundColor: Colors.brown),
          body: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(children: [
              Text('Moch. Rofiqi - 2031710135',
                  style: TextStyle(
                      fontSize: 20,
                      backgroundColor: Color.fromARGB(255, 194, 167, 157))),
              SizedBox(
                height: 10,
              ),
              Input(inputController: inputController),
              Dropdown(
                  listItem: listItem,
                  newValuee: _newValue,
                  onDropdownChange: onDropdownChange),
              Result(result: _result),
              Text('Riwayat Konversi',
                  style: TextStyle(
                      fontSize: 20,
                      backgroundColor: Color.fromARGB(255, 194, 167, 157))),
              SizedBox(
                height: 10,
              ),
              Expanded(child: View(listViewItem: listViewItem))
            ]),
          ),
        ));
  }
}
