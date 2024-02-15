import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Api/api.dart';
import 'main.dart';
import 'models/task.dart';
import 'widget/home_page.dart';
import 'widget/profile_page.dart';
import 'widget/search_page.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TD2',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;
    switch (_selectedIndex) {
      case 0:
        selectedPage = HomePage.content();
        break;
      case 1:
        selectedPage = SearchPage.content();
        break;
      case 2:
        selectedPage = ProfilePage.content();
        break;
      default:
        selectedPage = Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        backgroundColor: Colors.black, // Couleur de fond pour l'AppBar
      ),
      body: selectedPage,
      backgroundColor: Colors.black, // Couleur de fond pour le Scaffold
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
