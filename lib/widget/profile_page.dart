import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage {
  static Widget content() {
    return ProfilePageWidget();
  }
}

class ProfilePageWidget extends StatefulWidget {
  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      setState(() {
        userData = jsonDecode(response.body);
      });
    } else {
      // Handle errors appropriately for your application
      print('Failed to load user data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange, // Background color for the ProfilePage
      child: userData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Name: ${userData!['name']}', style: TextStyle(color: Colors.white, fontSize: 20.0)),
          Text('Username: ${userData!['username']}', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          Text('Email: ${userData!['email']}', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          // Add more details as needed
        ],
      ),
    );
  }
}
