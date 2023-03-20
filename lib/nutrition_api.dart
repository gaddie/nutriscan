import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nutriscan/constants.dart';
import 'homepage.dart';

Map<dynamic, dynamic> myMap = {};

Future<void> fetchData(BuildContext context, String name) async {
  final query = name;

  final url = Uri.parse(
      'https://nutrition-by-api-ninjas.p.rapidapi.com/v1/nutrition?query=$query');

  final response = await http.get(url, headers: {
    'X-RapidAPI-Key': '1ae28bc40bmsh896907c0773a856p109f81jsn6fed6eb3dc37',
    'X-RapidAPI-Host': 'nutrition-by-api-ninjas.p.rapidapi.com',
    'useQueryString': 'true',
  });

  if (response.statusCode == 200) {
    try {
      final data = jsonDecode(response.body);
      for (final key in data[0].keys) {
        final value = data[0][key];
        myMap[key] = value;
      }
    } catch (e) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: AlertDialog(
              backgroundColor: kMainColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nutriscan'),
                  Icon(
                    Icons.notifications,
                  ),
                ],
              ),
              content: Text('The food / fruit that you have\n'
                  'entered is not available or you\n'
                  'have mispell the fruit or food name.'),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );

      throw Exception('Failed to decode JSON data');
    } finally {
      isLoading = false;
    }
  } else {
    throw Exception('Failed to load data');
  }
}
