class Event {
  final String id;
  final String title;
  final String location;
  final DateTime date;

  Event({required this.id, required this.title, required this.location, required this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      location: json['location'],
      date: DateTime.parse(json['date']),
    );
  }
}