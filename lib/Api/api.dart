import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/task.dart';

class MyAPI {
  Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('assets/tasks.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['tasks'] != null) {
      final tasks = <Task>[];
      json['tasks'].forEach((element) {
        tasks.add(Task(
          id: element['id'],
          title: element['title'],
          tags: List<String>.from(element['tags']),
          nbhours: element['nbhours'],
          difficuty: element['difficulty'],
          description: element['description'],
        ));
      });
      return tasks;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
