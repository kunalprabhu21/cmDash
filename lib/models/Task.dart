class Task {
  final String id;
  final String officers;
  final int open;
  final int complete;
  final int close;


  const Task({
    required this.id,
    required this.officers,
    required this.open,
    required this.complete,
    required this.close,

  });

  Task copy({
    String? id,
    String? officers,
    int? open,
    int? complete,
    int? close,

  }) =>
      Task(
        id: id ?? this.id,
        officers: officers ?? this.officers,
        open: open ?? this.open,
        complete: complete ?? this.complete,
        close: close ?? this.close,

      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Task &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              officers == other.officers &&
              open == other.open &&
              complete == other.complete &&
              close  == other.close;

  @override
  int get hashCode => id.hashCode ^ officers.hashCode ^ open.hashCode ^ complete.hashCode ^ close.hashCode;
}