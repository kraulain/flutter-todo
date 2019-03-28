import 'dart:convert';

Task taskFromJson(String str) {
  final jsonData = json.decode(str);
  return Task.fromJson(jsonData);
}

String taskToJson(Task data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Task {
  int id;
  String description;
  String status;

  Task(
      {this.id,
        this.description,
        this.status})

  factory Task.fromJson(Map<String, dynamic> json) => new Task(
      id: json["id"],
      description: json["description"],
      status: json["status"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "status": status,
  };

}