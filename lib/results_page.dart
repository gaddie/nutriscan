import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'nutrition_api.dart';

List<List<dynamic>> myList =
    myMap.entries.map((entry) => [entry.key, entry.value]).toList();

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00425A),
        title: Text(myList[0][1]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              for (var i = 1; i < myList.length; i++)
                ItemsTile(
                  name: myList[i][0],
                  value: myList[i][1].toDouble(),
                  maximumValue: myList[i][1] > 50 ? 500 : 50,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemsTile extends StatelessWidget {
  ItemsTile(
      {required this.name, required this.value, required this.maximumValue});

  dynamic value;
  String name;
  double maximumValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Color(0xff00425A),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 30.0, left: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              SimpleCircularProgressBar(
                maxValue: maximumValue,
                backStrokeWidth: 3.0,
                progressStrokeWidth: 3.0,
                size: 50.0,
                valueNotifier: ValueNotifier(value),
                mergeMode: true,
                onGetText: (double value) {
                  TextStyle centerTextStyle = TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  );

                  return Text(
                    '${value.toStringAsFixed(1)}',
                    style: centerTextStyle,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
