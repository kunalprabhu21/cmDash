class Records {
  final String id;
  final String department;
  final int open;
  final int completed;
  final int pending;
  final int closed;

  const Records({
    required this.id,
    required this.department,
    required this.open,
    required this.completed,
    required this.pending,
    required this.closed,
  });

  Records copy({
    String? id,
    String? department,
    int? open,
    int? complete,
    int? pending,
    int? closed,
  }) =>
      Records(
        id: id ?? this.id,
        department: department ?? this.department,
        open: open ?? this.open,
        completed: complete ?? this.completed,
        pending: pending ?? this.pending,
        closed: closed ?? this.closed,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Records &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              department == other.department &&
              open == other.open &&
              completed  == other.completed &&
              pending == other.pending &&
              closed == other.closed;

  @override
  int get hashCode => id.hashCode ^ department.hashCode ^ open.hashCode ^ completed.hashCode ^ pending.hashCode ^ closed.hashCode;
}