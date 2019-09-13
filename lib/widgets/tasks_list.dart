import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    // false = user must tap button, true = tap outside dialog
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: Text('Deseja deletar a tarefa?'),
                        content: Text('Não será possivel desfazer essa ação'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(dialogContext)
                                  .pop(); // Dismiss alert dialog
                            },
                          ),
                          FlatButton(
                            child: Text('Delete'),
                            onPressed: () {
                              taskData.deleteTask(task);
                              Navigator.of(dialogContext)
                                  .pop(); // Dismiss alert dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            });
      },
    );
  }
}
