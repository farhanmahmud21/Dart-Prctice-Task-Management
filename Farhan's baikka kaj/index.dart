import 'dart:io';

class Task {
  String title;
  bool isCompleted;

  Task(this.title, {this.isCompleted = false});

  void toggleComplete() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return "[${isCompleted ? '✔' : ' '}] $title";
  }
}

class ToDoList {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title));
    print("Task added: \"$title\"");
  }

  void removeTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print("Invalid task index.");
      return;
    }
    print("Task removed: \"${tasks[index].title}\"");
    tasks.removeAt(index);
  }

  void toggleTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print("Invalid task index.");
      return;
    }
    tasks[index].toggleComplete();
    print("Task status updated: ${tasks[index]}");
  }

  void showTasks() {
    if (tasks.isEmpty) {
      print("No tasks available.");
    } else {
      print("\nTo-Do List:");
      for (int i = 0; i < tasks.length; i++) {
        print("${i + 1}. ${tasks[i]}");
      }
    }
  }
}

void main() {
  ToDoList toDoList = ToDoList();
  while (true) {
    print("\nOptions:");
    print("1. Add Task");
    print("2. Remove Task");
    print("3. Toggle Task Completion");
    print("4. View Tasks");
    print("5. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter task title: ");
        String? title = stdin.readLineSync();
        if (title != null && title.isNotEmpty) {
          toDoList.addTask(title);
        } else {
          print("Invalid task title.");
        }
        break;
      case '2':
        toDoList.showTasks();
        stdout.write("Enter task number to remove: ");
        String? indexStr = stdin.readLineSync();
        int? index = int.tryParse(indexStr ?? '')?.toInt();
        if (index != null) {
          toDoList.removeTask(index - 1);
        } else {
          print("Invalid input.");
        }
        break;
      case '3':
        toDoList.showTasks();
        stdout.write("Enter task number to toggle completion: ");
        String? indexStr = stdin.readLineSync();
        int? index = int.tryParse(indexStr ?? '')?.toInt();
        if (index != null) {
          toDoList.toggleTask(index - 1);
        } else {
          print("Invalid input.");
        }
        break;
      case '4':
        toDoList.showTasks();
        break;
      case '5':
        print("Exiting...");
        return;
      default:
        print("Invalid option. Please try again.");
    }
  }
}
