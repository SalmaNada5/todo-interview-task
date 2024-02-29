import 'dart:convert';

Tasks tasksFromJson(String str) => Tasks.fromJson(json.decode(str));

String tasksToJson(Tasks data) => json.encode(data.toJson());

class Tasks {
    final List<Todo>? todos;
    final int? total;
    final int? skip;
    final num? limit;

    Tasks({
        this.todos,
        this.total,
        this.skip,
        this.limit,
    });

    Tasks copyWith({
        List<Todo>? todos,
        int? total,
        int? skip,
        int? limit,
    }) => 
        Tasks(
            todos: todos ?? this.todos,
            total: total ?? this.total,
            skip: skip ?? this.skip,
            limit: limit ?? this.limit,
        );

    factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        todos: json["todos"] == null ? [] : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "todos": todos == null ? [] : List<dynamic>.from(todos!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Todo {
    final int? id;
    final String? todo;
    final bool? completed;
    final int? userId;

    Todo({
        this.id,
        this.todo,
        this.completed,
        this.userId,
    });

    Todo copyWith({
        int? id,
        String? todo,
        bool? completed,
        int? userId,
    }) => 
        Todo(
            id: id ?? this.id,
            todo: todo ?? this.todo,
            completed: completed ?? this.completed,
            userId: userId ?? this.userId,
        );

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
    };
}
