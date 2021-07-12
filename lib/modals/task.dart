class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }

  static Map<String, dynamic> toMap(Task task) => {
        'title': task.title,
        'isDone': task.isDone,
      };
  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(
      title: jsonData['title'],
      isDone: jsonData['isDone'],
    );
  }
}
