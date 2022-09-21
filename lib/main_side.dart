import 'dart:html';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pkapp2/data.dart';
import 'package:pkapp2/main.dart';

class main_side extends StatelessWidget {
  const main_side({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/images/city.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Color(0XFF191923).withOpacity(0.5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expression of oneself is quite paramount,\nif wish to make one's own space...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DefaultTextStyle(
                            style: TextStyle(color: Colors.white),
                            child: Row(
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '<',
                                      style: TextStyle(color: Colors.amber)),
                                  TextSpan(
                                      text: 'Flutter',
                                      style: TextStyle(color: Colors.amber)),
                                  TextSpan(
                                      text: '>',
                                      style: TextStyle(color: Colors.amber))
                                ])),
                                Text(" We're "),
                                AnimatedTextKit(animatedTexts: [
                                  TyperAnimatedText(
                                      'making portfolio with flutter web',
                                      speed: Duration(milliseconds: 30)),
                                  TyperAnimatedText('letting know that',
                                      speed: Duration(milliseconds: 30)),
                                  TyperAnimatedText(
                                      'with Flutter web making everything possible...',
                                      speed: Duration(milliseconds: 30)),
                                ]),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.explore),
                            label: Text('Explore More'))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              publications(
                label: 'Subscribers',
                val: 89,
              ),
              publications(
                label: 'videos',
                val: 40,
              ),
              publications(
                label: 'Github projects',
                val: 30,
              ),
              publications(
                label: 'Stars',
                val: 13,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'My Projects',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.3,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  data_projection(item: items[index])),
          SizedBox(
            height: 15,
          ),
          Text('Copyright| Flutter Community - 2022'),
        ],
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////

class data_projection extends StatelessWidget {
  const data_projection({Key? key, required this.item}) : super(key: key);
  final data item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            item.image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0XFF191923).withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp),
                  label: Text('Read more>>'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class publications extends StatelessWidget {
  const publications({Key? key, required this.label, required this.val})
      : super(key: key);
  final int val;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          TweenAnimationBuilder(
              tween: IntTween(begin: 0, end: val),
              duration: Duration(seconds: 3),
              builder: (context, index, child) => Text(
                    index.toString() + 'k+',
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  )),
          SizedBox(
            width: 10,
          ),
          Text("$label"),
        ],
      ),
    );
  }
}
