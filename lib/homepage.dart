import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nutriscan/constants.dart';
import 'package:nutriscan/results_page.dart';
import 'nutrition_api.dart';

bool isLoading = false;

List<List<dynamic>> myList =
    myMap.entries.map((entry) => [entry.key, entry.value]).toList();

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late AnimationController controller;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: Image.asset(
            "images/background.jpeg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Nutriscan'),
            leading: Icon(Icons.compost),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
          ),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kMainColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          padding: EdgeInsets.all(14.0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    color: kMainColor,
                                    child: Center(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(30.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Help',
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  right: 20.0, left: 20.0),
                                              child: kHelpText),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.question_mark,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Type the food / fruit you wish to scan for nutritional information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (text) {
                        name = text;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Name'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
                    child: FilledButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await fetchData(context, name);

                        // wait for fetchData() to finish
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsPage(),
                          ),
                        );
                        setState(() {
                          // set isLoading to false after fetchData() is done
                          isLoading = false;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kMainColor)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: isLoading
                            ? // use conditional operator to show CircularProgressIndicator if isLoading is true
                            CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Show Nutritional Contents',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(width: 20.0, height: 100.0),
                      const Text(
                        'Life hacks:',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(width: 20.0, height: 100.0),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Horizon',
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText('EXERCISE'),
                            RotateAnimatedText('HYDRATE'),
                            RotateAnimatedText('BALANCED DIET'),
                            RotateAnimatedText('GOOD HYGIENE'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
