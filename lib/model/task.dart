class Task {
  String name;
  String memo;
  bool isDone;
  final DateTime createdAt;
  DateTime updatedAt;

  Task(
      {this.name,
      this.memo,
      this.isDone = false,
      this.createdAt,
      this.updatedAt});
}
