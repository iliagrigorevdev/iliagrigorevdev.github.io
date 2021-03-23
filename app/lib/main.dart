import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const String title = 'Projects by Ilia Grigorev';
const String origin = 'https://github.com/iliagrigorevdev';
const double screenshotWidth = 1280;
const double screenshotHeight = 640;

class Project {
  final int id;
  final String name;
  final String repository;

  String get repositoryUrl => '$origin/$repository';
  String get screenshot => 'images/screenshot$id.jpg';

  const Project(this.id, this.name, this.repository);
}

const List<Project> projects = [
  Project(1, 'Quoridor', 'quoridor-web'),
  Project(2, 'Twisty Editor', 'twistyeditor'),
  Project(3, 'Bowling', 'bowling'),
  Project(4, 'Tangram', 'tangram'),
  Project(5, 'AI Snake', 'ai-snake'),
  Project(6, 'Voxel Challenge', 'voxelchallenge'),
  Project(7, 'Townlets', 'townlets'),
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue
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
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
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
                return InkWell(
                  onTap: () => html.window.open(project.repositoryUrl, project.name),
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                                project.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            )
                          )
                        ]
                      )
                    )
                  ),
                );
              }
            );
          }).toList()
        ),
      ),
    );
  }
}
