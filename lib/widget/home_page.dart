import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class HomePage {
  static Widget content() {
    List<Task> tasks = Task.generateTask(5); // Adjust the number of tasks as needed

    return Container(
      color: Colors.blue,
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
}
