
class Task {
  String? title;
  String? detail;
  bool isDone;

  Task({this.title, this.detail, this.isDone = false});

  void taskDone(){
    isDone = !isDone;
  }

}
