class NotifyModel {
  const NotifyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.read,
    required this.date,
  });

  final String id;
  final String title;
  final bool read;
  final String description;
  final String date;

  factory NotifyModel.fromMap(Map<String, dynamic> map) {
    return NotifyModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      read: map['read'],
      date: map['date'],
    );
  }
}
