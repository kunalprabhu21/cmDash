class Budget {
  final String id;
  final String department;
  final int total;
  final int delivered;
  final int with_govt;
  final int with_dept;
  final int yet_to_start;

  const Budget({
    required this.id,
    required this.department,
    required this.total,
    required this.delivered,
    required this.with_govt,
    required this.with_dept,
    required this.yet_to_start,
  });

  Budget copy({
    String? id,
    String? department,
    int? total,
    int? delivered,
    int? with_govt,
    int? with_dept,
    int? yet_to_start,
  }) =>
      Budget(
        id: id ?? this.id,
        department: department ?? this.department,
        total: total ?? this.total,
        delivered: delivered ?? this.delivered,
        with_govt: with_govt ?? this.with_govt,
        with_dept: with_dept ?? this.with_dept,
        yet_to_start: yet_to_start ?? this.yet_to_start,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Budget &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              department == other.department &&
              total == other.total &&
              delivered == other.delivered &&
              with_govt  == other.with_govt &&
              with_dept == other.with_dept &&
              yet_to_start == other.yet_to_start;

  @override
  int get hashCode => id.hashCode ^ department.hashCode ^ total.hashCode ^ delivered.hashCode ^ with_govt.hashCode ^ with_dept.hashCode ^ yet_to_start.hashCode;
}