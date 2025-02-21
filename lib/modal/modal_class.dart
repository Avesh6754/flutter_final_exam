class ModalClass {
  int? id;
  late String habitName, category;
  late var targetDays;
  late var remindertime;
  late var progress;

  ModalClass(
      {this.id,
      required this.category,
      required this.habitName,
      required this.progress,
      required this.remindertime,
      required this.targetDays});

  factory ModalClass.fromMap(Map m1) {
    return ModalClass(
        category: m1['category'],
        habitName: m1['habitName'],
        progress: m1['progress'],
        remindertime: m1['remindertime'],
        targetDays: m1['targetDays'],
        id: m1['id']);
  }
 static Map<String, dynamic> toMap(ModalClass items)
  {
    return {
      'id':items.id,
      'category':items.category,
      'progress':items.progress,
      'remindertime':items.remindertime,
      'targetDays':items.targetDays,
      'habitName':items.habitName
    };
  }
}
