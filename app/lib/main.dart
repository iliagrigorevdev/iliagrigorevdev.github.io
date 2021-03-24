import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const String repositoryOrigin = 'https://github.com/iliagrigorevdev';
const String pageOrigin = 'https://iliagrigorevdev.github.io';
const double screenshotWidth = 1280;
const double screenshotHeight = 640;

class Project {
  final int id;
  final String name;
  final String title;

  String get repositoryUrl => '$repositoryOrigin/$name';
  String get pageUrl => '$pageOrigin/$name';
  String get screenshot => 'images/screenshot$id.jpg';

  const Project(this.id, this.name, this.title);
}

const List<Project> projects = [
  Project(1, 'quoridor-web', 'Quoridor'),
  Project(2, 'twistyeditor', 'Twisty Editor'),
  Project(3, 'bowling', 'Bowling'),
  Project(4, 'tangram', 'Tangram'),
  Project(5, 'ai-snake', 'AI Snake'),
  Project(6, 'voxelchallenge', 'Voxel Challenge'),
  Project(7, 'townlets', 'Townlets'),
  Project(8, 'twistylander', 'Twisty Lander'),
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projects by Ilia Grigorev',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[700],
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Projects',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  'by Ilia Grigorev',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                //aspectRatio: screenshotWidth / screenshotHeight,
                height: screenshotHeight,
                enlargeCenterPage: true,
              ),
              items: projects.map((project) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(project.screenshot),
                                    width: screenshotWidth,
                                    height: screenshotHeight,
                                    fit: BoxFit.cover
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      child: Text(
                                        project.title,
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    )
                                  )
                                ]
                              )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () => html.window.open(project.repositoryUrl, project.title),
                                    child: Text('Open'),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () => html.window.open(project.pageUrl, project.title),
                                    child: Text('Run'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
