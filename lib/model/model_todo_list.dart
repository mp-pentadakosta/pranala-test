class ModelToDoList {
  int userId;
  int id;
  String title;
  bool completed;

  ModelToDoList({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ModelToDoList.fromJson(Map<String, dynamic> json) => ModelToDoList(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );
}
