


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Api/api.dart';
import '../models/task.dart';

class SearchPage {
  static Widget content() {
    return FutureBuilder<List<Task>>(
      future: MyAPI().getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Task> tasks = snapshot.data ?? [];

          return Container(
            color: Colors.green,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Index: $index'),
                      Text('Tags: ${task.tags.join(', ')}'),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
