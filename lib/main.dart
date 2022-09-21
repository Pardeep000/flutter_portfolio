import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
// import 'package:pkapp2/data.dart';
import 'package:pkapp2/main_side.dart';

void main() {
  runApp(MaterialApp(
    title: 'Portfolio site',
    //home: home_site(),
    home: homeapp(),
    theme:
        ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF1E1E28)),
    debugShowCheckedModeBanner: false,
  ));
}

class homeapp extends StatelessWidget {
  const homeapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('--Portfolio from Flutter web--')),
      ),
      body: Container(
        //constraints: BoxConstraints(
        //maxWidth: MediaQuery.of(context).size.width, minWidth: 500),
        //constraints: BoxConstraints(maxWidth: 1440),
        child: Row(
          children: [
            Expanded(flex: 2, child: sidebar()),
            SizedBox(
              width: 15,
            ),
            Expanded(flex: 7, child: main_side()),
          ],
        ),
      ),
    );
  }
}

class sidebar extends StatelessWidget {
  const sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          personal_info(),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  location_info(data1: 'Residence', data2: 'California'),
                  location_info(data1: 'City', data2: 'San Fransico'),
                  location_info(data1: 'Age', data2: '45'),
                  Divider(),
                  Text(
                    'skill',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: circular_skill(
                          label: 'HTML',
                          percentage: 0.8,
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: circular_skill(
                          label: 'CSS',
                          percentage: 0.65,
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: circular_skill(
                          label: 'JAVASCRIPT',
                          percentage: 0.54,
                        ),
                      ),
                    ],
                  ),
                  //
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Coding',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),

                  linear_skill(
                    label: 'Dart',
                    percentage: 0.56,
                  ),

                  linear_skill(
                    label: 'Flutter',
                    percentage: 0.67,
                  ),

                  linear_skill(
                    label: 'Android',
                    percentage: 0.89,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Knowledge',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  knowledge(
                    label: 'PCB Designing',
                  ),
                  knowledge(
                    label: 'PCB Prototyping',
                  ),
                  knowledge(
                    label: 'PCB Fabrication',
                  ),
                  knowledge(
                    label: 'Electronics Circuits',
                  ),
                  knowledge(
                    label: 'Soldering skills',
                  ),
                  Divider(),
                  TextButton(
                      onPressed: () {},
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text('Download CV'),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundImage:
                                  AssetImage('assets/images/download.png'),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xFF242430),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class knowledge extends StatelessWidget {
  const knowledge({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage('assets/images/check.png'),
          ),
          SizedBox(
            width: 15,
          ),
          Text('$label'),
        ],
      ),
    );
  }
}

class linear_skill extends StatelessWidget {
  const linear_skill({Key? key, required this.label, required this.percentage})
      : super(key: key);
  final double percentage;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text('$label'),
              SizedBox(
                width: 10,
              ),
              Text((percentage * 100).toString() + '%'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: Duration(seconds: 2),
              builder: (context, double index, child) =>
                  LinearProgressIndicator(
                    value: index,
                    color: Colors.amber,
                    backgroundColor: Colors.grey,
                  )),
        ],
      ),
    );
  }
}

class circular_skill extends StatelessWidget {
  const circular_skill(
      {Key? key, required this.label, required this.percentage})
      : super(key: key);
  final double percentage;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: Duration(seconds: 2),
              builder: (context, double index, child) => Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: index,
                        color: Colors.amber,
                        backgroundColor: Colors.grey,
                      ),
                      Center(
                          child: Text(
                        (index * 100).toString() + '%',
                        style: TextStyle(color: Colors.grey),
                      )),
                    ],
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Text('$label'),
      ],
    );
  }
}

class location_info extends StatelessWidget {
  const location_info({Key? key, required this.data1, required this.data2})
      : super(key: key);
  final String? data1, data2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [Text('$data1'), Spacer(), Text('$data2')],
      ),
    );
  }
}

class personal_info extends StatelessWidget {
  const personal_info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.30,
      child: Container(
        color: Color(0xFF242430),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/jack.jpg'),
            ),
            Spacer(),
            Text('Jack Dorsey'),
            Spacer(),
            Text(
              'Co-founder of Twitter and Square Inc.',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
